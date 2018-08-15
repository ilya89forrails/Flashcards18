require 'rails_helper'

describe User do
  let(:user) { FactoryBot.build(:user, user_params) }
  let(:user_params) { { password: 'il' } }
  context 'with short password' do
    it 'not pass validation' do
      expect(user).not_to be_valid
    end
  end
end
