require 'rails_helper'

RSpec.describe User, type: :model do

  it 'not pass validation - short password' do
    user = User.new(email: 'ilya@gmail.com', crypted_password: 'il')
    expect(user).not_to be_valid
  end

end
