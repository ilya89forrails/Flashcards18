class HomeController < ApplicationController
  def index
    if current_user
      @card = Card.get_random
    end
  end

  def check_answer
    @card = Card.find(params[:card_id])
    if params[:answer] == @card.original_text
      @card.review_date = Date.today + 3.days
      result = 'You are right!'
      @card.save
    else
      result = "Wrong! '#{@card.translated_text}' was translated as '#{@card.original_text}'"
    end
    redirect_to root_path
  end
end
