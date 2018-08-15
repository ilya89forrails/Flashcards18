FactoryBot.define do
  factory :card do
    original_text 'schwarz'
    translated_text 'black'
    review_date Date.today
  end
end
