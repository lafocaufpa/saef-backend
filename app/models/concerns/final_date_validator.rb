class FinalDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    return if final_date_valid?(value, record)

    record.errors.add(
      attribute,
      :invalid_final_date,
      message: options[:message] || 'Não é válido',
      value: value
    )
  end

  private 
  def final_date_valid?(date, record)
    date_obj = Date.parse(date.to_s) rescue nil

    return false unless date_obj

    date_obj > record.start_date.to_date
  end
end