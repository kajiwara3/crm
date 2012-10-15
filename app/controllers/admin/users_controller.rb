# coding: utf-8
class Admin::UsersController < Admin::Base
  def index
    @user_list = User.order(:id).
      paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(params[:user])

    if @user.save
      return redirect_to [:admin, @user], notice: "ユーザー情報を更新しました"
    end
    render "edit"
  end
end
