class HomeController < ApplicationController
  require_relative '../services/levenstein.rb'

  def index
    @card = Card.random if current_user
  end

  def check_answer
    @card = Card.find(params[:card_id])
    checker = CheckAnswer.new()
    if params[:answer] == @card.original_text
      result = checker.correct_answer(@card)
    elsif checker.mistype_check(params[:answer], @card.original_text)
      result = checker.mistype_answer(params[:answer], @card)
    else
      result = checker.incorrect_answer(@card)
    end
    redirect_to(root_path, notice: result)
  end
end
