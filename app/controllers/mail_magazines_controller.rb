class MailMagazinesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @mail_magazine_list = MailMagazine.
      page(params[:page]).order("id desc")
  end

  def show
    @mail_magazine = MailMagazine.find(params[:id])
  end

  def edit
    @mail_magazine = MailMagazine.find(params[:id])
  end
end
