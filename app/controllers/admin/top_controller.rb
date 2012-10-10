class Admin::TopController < Admin::Base
  skip_before_filter :admin_login_required
  def index
  end
end
