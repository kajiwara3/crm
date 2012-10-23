class MailMagazinesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @mail_magazine_list = MailMagazine.
      page(params[:page]).order("id desc")
  end
end
