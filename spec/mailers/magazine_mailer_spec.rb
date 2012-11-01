require "spec_helper"

describe MagazineMailer do
  describe "reserved_mail" do
    let(:mail) { MagazineMailer.reserved_mail }

    it "renders the headers" do
      mail.subject.should eq("Reserved mail")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
