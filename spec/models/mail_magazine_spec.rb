# coding: utf-8
require 'spec_helper'

describe MailMagazine do
  context "subject body reserved_atを設定した場合" do
    before do
      @mail_magazine = MailMagazine.new(
        subject: "マガジン",
        body: "内容",
        reserved_at: '2012-10-17 14:07:52'
      )
    end
    it "サブジェクトがセットされている事" do
      @mail_magazine.subject.should == 'マガジン'
    end
    it "内容がセットされている事" do
      @mail_magazine.body.should == '内容'
    end
    it "送信日時がセットされている事" do
      @mail_magazine.reserved_at.strftime('%Y-%m-%d %H:%M:%S').should == "2012-10-17 14:07:52"
    end
  end

  context "subjectが未設定の場合" do
    before do
      @mail_magazine = MailMagazine.new(
        body: "内容",
        reserved_at: '2012-10-17 14:07:52'
      )
    end
    it "エラーにならないこと" do
      @mail_magazine.should_not be_valid
    end
  end
end
