class MailMagazinesController < ApplicationController
  before_filter :authenticate_user!
  def index
    #@mail_magazine_list = MailMagazine.order('id desc').
    #  paginate(page: params[:page], per_page: 5)

    @mail_magazine_list = MailMagazine.
      page(params[:page]).order("id desc")
  end
end
