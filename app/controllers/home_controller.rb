class HomeController < ApplicationController
  def index
  	if true #current_user
  		@card = Card.get_random
        #@card = current_user.cards.get_random
      end
    end


  def check_answer
    @card = Card.find(params[:id])
    answer = params[:answer]
    if answer == @card.original_text
	   @card.review_date = Date.today + 3.days
	   result = 'You are right!'
       @card.save
    else
      result = "Wrong! '#{card.translated_text}' was translated as '#{card.original_text}'"
    end
    flash[:notice] = result
    redirect_to root_path
  end
end
