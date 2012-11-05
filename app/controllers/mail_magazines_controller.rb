# coding: utf-8
class MailMagazinesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @mail_magazine_list = Kaminari::paginate_array(current_user.mail_magazines.order("id desc")).
      page(params[:page]).per(5)
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

  def test_sending
    @target = params[:target]
    if @target
      @mail_magazine = MailMagazine.find(params[:id])
      MagazineMailer.magazine_sending(@mail_magazine, @target).deliver
      redirect_to @mail_magazine, notice: "送信しました"
    end
  end

  def target_csv_upload_form
  end

  def target_csv_upload
    if params[:target_list].blank?
      flash[:error] = "ファイルを選択してください"
      return render "target_csv_upload_form"
    end

    require 'csv'
    @mail_magazine = MailMagazine.find(params[:id])
    begin
      reader = params[:target_list].read
      CSV.parse(reader) do |row|
        @magazine_target = MagazineTarget.new({
          name: row[0],
          email: row[1]
        })
        MailMagazine.transaction do
          @mail_magazine.magazine_targets << @magazine_target
        end
      end
    rescue => e
      flash[:error] = "error![#{e.message}]"
      return render "target_csv_upload_form"
    else
      return redirect_to @mail_magazine, notice: "宛先を登録しました"
    end
  end
end
