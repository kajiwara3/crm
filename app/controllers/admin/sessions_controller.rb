class Admin::SessionsController < Admin::Base
  def create
    administrator = Administrator.authenticate(params[:email], params[:password])
    if administrator
      session[:administrator_id] = administrator.id
    else
      flash.alert = "emailとパスワードが一致しません"
    end
    redirect_to params[:from] || root
  end

  def destroy
    session.delete(:administrator_id)
    redirect_to :root
  end
end
