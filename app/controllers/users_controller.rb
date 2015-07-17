class UsersController < ApplicationController

  def index 
   @user = User.all
  end


  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else 
      render :new
    end
  end
 
  def show 
    @card = Card.new
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    p = user_params

    if user_params[:password].blank?
      p.delete(:password)
      p.delete(:password_confirmation)
    end
    @user.update! p
    flash[:notice] = "Successful Update"
    redirect_to user_path(@user)
  end

  def destroy 
    @user = User.find params[:id]
    @user.destroy!
    session.clear
    flash[:notice] = "Bye."
    redirect_to cards_path
  end 

private

    # Use strong_parameters for attribute whitelisting
    # Be sure to update your create() and update() controller methods.

    def user_params
      params.require(:user).permit(:username, :password, :fname, :lanme, :email, :password_confirmation, :balance, :phone)
    end

end