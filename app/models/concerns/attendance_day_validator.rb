class AttendanceDayValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    return if valid_date?(value, record)

    record.errors.add(
      attribute,
      :invalid_day,
      message: options[:message] || 'Não é válido, está fora do intervalo do Plano de Estágio!',
      value: value
    )
  end

  private

  def valid_date?(day, record)
    start_date = record.task.internship_plan.start_date.to_date
    final_date = record.task.internship_plan.final_date.to_date

    return (day >= start_date) && (day <= final_date)
  end
end