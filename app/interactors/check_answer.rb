class CheckAnswer
  include Interactor

  def call
    if context.answer == context.card.original_text
      context.card.review_date = context.card.review_date + 3.days
      context.message = 'You are right!'
    else
      context.message = "Wrong! '#{card.translated_text}' was translated as '#{card.original_text}'"
    end
  end