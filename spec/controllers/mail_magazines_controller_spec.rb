# coding: utf-8
require 'spec_helper'
describe MailMagazinesController do
  before do
    @magazine1 = MailMagazine.create(
      subject: 'mail1',
      body: 'body1',
      reserved_at: 1.days.from_now
    )
    @magazine2 = MailMagazine.create(
      subject: 'mail2',
      body: 'body2',
      reserved_at: 2.days.from_now
    )
  end
  login_user
  it 'should be successful' do
    get 'index'
    response.should be_success
  end
end
