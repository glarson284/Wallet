class UserCardsController < ApplicationController
  def create
    user = User.find user_card_params[:user_id]
    UserCard.create user_card_params
    redirect_to cards_path
  end

  def destroy
    uc = UserCard.where(user_id: user_card_params[:user_id], card_id: user_card_params[:card_id]).first
    uc.destroy
    redirect_to cards_path
  end
  private

  def user_card_params
    params.require(:user_card).permit(:user_id, :card_id)
  end

end
