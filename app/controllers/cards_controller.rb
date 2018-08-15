class CardsController < ApplicationController
  before_action :set_card, only: [:edit, :show, :update, :destroy]

  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def edit
  end

  def show
  end

  def create
    @card = Card.new(card_params)
    @card.review_date = Date.today + 3.days
    if @card.save
      redirect_to cards_path
    else
      render 'new'
    end
  end

  def update
    @card.update(card_params)
    redirect_to cards_path
  end

  def destroy
    @card.destroy
    redirect_to cards_path
  end

  private

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date, :pic)
  end

  def set_card
    @card = Card.find(params[:id])
  end
end
