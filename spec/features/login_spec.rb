require 'rails_helper'

describe 'Login/logout' do
  it 'User can login/logout' do
    @user = FactoryBot.create(:user)
    visit login_path
    fill_in('email', with: 'user@server.com')
    fill_in('password', with: 'pass')
    click_button('Login')
    expect(page).to have_content 'Login successful'
    click_link('Logout')
    expect(page).to have_content 'Login'
  end
end
