require 'rails_helper'

describe 'Homepage' do
  let!(:user) { FactoryBot.create(:user) }
  let!(:card) { FactoryBot.create(:card) }

  before do
    visit login_path
    fill_in('email', with: 'user@server.com')
    fill_in('password', with: 'pass')
    click_button('Login')
  end

  context 'checks equity of user answer and translated text' do
    it 'should show correct message' do
      visit root_path
      fill_in('answer', with: 'schwarz')
      click_button 'Check answer'
      expect(page).to have_content 'You are right!'
    end
  end
end
