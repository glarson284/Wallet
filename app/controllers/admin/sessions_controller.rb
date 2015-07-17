class Admin::SessionsController < ApplicationController

  def new
  end

  def create
    @admin = Admin.find_by_username (params[:username])
    if @admin.present?
      if @admin.password == params[:password]
        session[:admin_id] = @admin.id
        redirect_to admin_cards_path
      else
        flash[:alert] = "wrong password idiot."
        redirect_to new_admin_sessions_path
      end
    else
      flash[:alert] = "No admin found with that username idiot."
      redirect_to new_admin_sessions_path
    end
  end

  def destroy
  end

end
