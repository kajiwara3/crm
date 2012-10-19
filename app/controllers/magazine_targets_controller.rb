class MagazineTargetsController < ApplicationController
  before_filter :authenticate_user!

  def index
    magazine = MailMagazine.find(params[:mail_magazine_id])
    rel = magazine.magazine_targets
    @target_list = rel.order(:id).
      paginate(page: params[:page], per_page: 5)
  end
end
