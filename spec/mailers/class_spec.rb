require "rails_helper"

RSpec.describe ClassMailer, type: :mailer do
  describe "name" do
    let(:mail) { ClassMailer.name }

    it "renders the headers" do
      expect(mail.subject).to eq("Name")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "Method" do
    let(:mail) { ClassMailer.Method }

    it "renders the headers" do
      expect(mail.subject).to eq("Method")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "name" do
    let(:mail) { ClassMailer.name }

    it "renders the headers" do
      expect(mail.subject).to eq("Name")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
