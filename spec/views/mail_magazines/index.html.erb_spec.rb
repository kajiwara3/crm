# coding: utf-8
require 'spec_helper'
describe "mail_magazines/index.html.erb" do
  before do
    Factory.create(:mail_magazine)
    assign(
      :mail_magazine_list, MailMagazine.order('id desc').
                        paginage(page: params[:page], per_page: 5)
    )
    render
  end
  it "メールマガジンのsubjectが表示される事" do
    rendered.should =~ /MyString/
  end
end
