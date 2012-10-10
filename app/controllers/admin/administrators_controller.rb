class Admin::AdministratorsController < Admin::Base
  def index
    @administrators = Administrator.order(:id).
      paginate(page: params[:page], per_page: 5)
  end
end
