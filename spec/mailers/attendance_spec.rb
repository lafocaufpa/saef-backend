require "rails_helper"

RSpec.describe AttendanceMailer, type: :mailer do
  describe "attendance_reminder" do
    let(:mail) { AttendanceMailer.attendance_reminder }

    it "renders the headers" do
      expect(mail.subject).to eq("Attendance reminder")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
