class MagazineTargetsController < ApplicationController
  before_filter :authenticate_user!

  def index
    magazine = MailMagazine.find(params[:mail_magazine_id])
    @target_list = Kaminari.paginate_array(magazine.magazine_targets).
      page(params[:page]).per(5)
  end
end
