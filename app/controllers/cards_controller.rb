class CardsController < ApplicationController

  def index 
   @card = Card.all
  end


  def new 
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.users << current_user

    if @card.valid?
      @card.save!
      redirect_to cards_path
    else
      flash[:alert] = "There was an error with your submission"
      render :new
    end
  end
  
  def expired
    @cards = Card.expired
    render :index
  end

  def show
    @card = Card.find(params[:id])
  end

  def destroy 
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to cards_path
  end



private

    # Use strong_parameters for attribute whitelisting
    # Be sure to update your create() and update() controller methods.

    def card_params
      params.require(:card).permit(:cnumber, :ctype, :exmonth, :exyear)
    end

end

