class Admin::AdministratorsController < Admin::Base
  def index
    @administrators = Kaminari.paginate_array(Administrator.order(:id)).
      page(params[:page]).per(5)
  end
end
