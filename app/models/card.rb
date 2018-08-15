class Card < ApplicationRecord
  validates :original_text, :translated_text, :review_date, presence: true
  validate :same_words, on: :create
  belongs_to :user, optional: true
  scope :unreviewed, -> { where('review_date <= ?', Date.today) }
  scope :random_order, -> { unreviewed.order(Arel.sql('random()')) }
  mount_uploader :pic, PicUploader

  def same_words
    if original_text.casecmp(translated_text.downcase).zero?
      errors.add(:translated_text, 'Translated text cannot equal original text')
    end
  end

  def self.random
    random_order.first
  end
end
