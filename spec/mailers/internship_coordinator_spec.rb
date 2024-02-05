require "rails_helper"

RSpec.describe InternshipCoordinatorMailer, type: :mailer do
  describe "notify_new_user" do
    let(:mail) { InternshipCoordinatorMailer.notify_new_user }

    it "renders the headers" do
      expect(mail.subject).to eq("Notify new user")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
