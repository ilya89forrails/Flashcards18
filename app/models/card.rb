class Card < ApplicationRecord
  validates :original_text, :translated_text, :review_date, presence: true
  validate :same_words, on: :create
  belongs_to :user, optional: true
  scope :unreviewed, -> { where('review_date <= ?', Date.today) }

  def same_words
    if original_text.casecmp(translated_text.downcase).zero?
      errors.add(:translated_text, 'Translated text cannot equal original text')
    end
  end

  def self.get_random
    unreviewed.order('RANDOM()').first
  end
end
