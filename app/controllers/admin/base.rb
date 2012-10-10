# coding: utf-8
class Admin::Base < ApplicationController
  before_fliter :admin_authorize
  before_filter :admin_login_required

  private
  def admin_authorize
    if session[:administrator_id]
      @current_admin = Administrator.find_by_id(session[:administrator_id])
      session.delete(:member_id) unless @currennt_admin
    end
  end

  def admin_login_required
    raise Forbidden unless @current_admin.try(:administrator?)
  end
end