require 'rails_helper'

describe Card do
  let(:card) { FactoryBot.build(:card, card_params) }
  let(:card_params) { { original_text: 'schwarz', translated_text: 'black' } }
  context 'with valid params' do
    it 'should pass validation' do
      expect(card).to be_valid
    end
  end

  context 'with equal original and translated values' do
    let(:card_params) { { original_text: 'schwarz', translated_text: 'SCHWARZ' } }
    it 'should not pass validation' do
      expect(card).not_to be_valid
    end
  end

  context 'with empty original text' do
    let(:card_params) { { original_text: '' } }
    it 'should not pass validation' do
      expect(card).not_to be_valid
    end
  end

  context 'with empty translated text' do
    let(:card_params) { { translated_text: '' } }
    it 'should not pass validation' do
      expect(card).not_to be_valid
    end
  end
end
