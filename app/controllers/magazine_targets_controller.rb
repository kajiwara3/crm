class MagazineTargetsController < ApplicationController
  before_filter :authenticate_user!

  def index
    magazine = MailMagazine.find(params[:mail_magazine_id])
    @target_list = MagazineTarget.find_all("magazine_id = magazine.id").page(params[:page])
    # rel = magazine.magazine_targets
    # @target_list = rel.page(params[:page]).order(:id)
      #paginate(page: params[:page], per_page: 5)
  end
end
