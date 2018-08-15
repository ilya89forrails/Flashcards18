require 'rails_helper'

describe 'Login/logout' do
  let!(:user) { FactoryBot.create(:user) }
  context 'user should' do
    it 'login and logout' do
      visit login_path
      fill_in('email', with: 'user@server.com')
      fill_in('password', with: 'pass')
      click_button('Login')
      expect(page).to have_content 'Login successful'
      click_link('Logout')
      expect(page).to have_content 'Login'
    end
  end
end
