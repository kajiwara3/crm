# coding: utf-8
class MagazineTargetsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @magazine = MailMagazine.find(params[:mail_magazine_id])
    @target_list = Kaminari.paginate_array(@magazine.magazine_targets).
      page(params[:page]).per(5)
  end

  def new
    @magazine = MailMagazine.find(params[:mail_magazine_id])
    @magazine_target = MagazineTarget.new
  end

  def create
    @magazine = MailMagazine.find params[:mail_magazine_id]
    @magazine_target = MagazineTarget.new
    @magazine_target.assign_attributes params[:magazine_target]
    if @magazine.magazine_targets << @magazine_target
      return redirect_to [@magazine, :magazine_targets], notice: "宛先を追加しました"
    end
    render "new"
  end
end
