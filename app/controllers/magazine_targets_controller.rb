class MagazineTargetsController < ApplicationController
  before_filter :authenticate_user!

  def index
    magazine = MailMagazine.find(params[:mail_magazine_id])
    rel = magazine.magazine_targets
    #@target_list = rel.page params[:page]
    #@target_list = MagazineTarget.page(params[:page])
    @target_list = Kaminari.paginate_array(rel).page(params[:page])
  end
end
