require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'Faranosh', email: 'faranosh.amini4@gmail.com', password: '123456789')
    @user.confirm
  end
  describe 'Testing the validations for user model' do
    it 'should be valid' do
      expect(@user).to be_valid
    end
    it 'should be valid' do
      expect(@user.name).to eq 'Faranosh'
    end
    it 'should be valid' do
      expect(@user.email).to eq 'faranosh.amini4@gmail.com'
    end
    it 'should be valid' do
      expect(@user.password).to eq '123456789'
    end
  end
end
