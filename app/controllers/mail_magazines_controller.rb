# coding: utf-8
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

  def update
    @mail_magazine = MailMagazine.find(params[:id])
    @mail_magazine.assign_attributes(params[:mail_magazine])

    if @mail_magazine.save
      return redirect_to @mail_magazine, notice: "更新しました"
    end
    render "edit"
  end

  def new
    @mail_magazine = MailMagazine.new
  end

  def create
    @mail_magazine = MailMagazine.new
    @mail_magazine.assign_attributes(params[:mail_magazine])
    if @mail_magazine.save
      return redirect_to @mail_magazine, notice: "保存しました"
    end
    render "new"
  end
end
