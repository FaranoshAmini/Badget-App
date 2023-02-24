require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.new(name: 'Faranosh', email: 'faranosh.amini4@gmail.com', password: '123456789')
    @category = Category.create(name: 'Office Payments', icon: '123.png', user_id: @user.id)
  end
  describe 'Testing the validations for category model' do
    it 'should be valid' do
      expect(@category).to be_valid
    end
    it 'should be valid' do
      expect(@category.name).to eq 'Office Payments'
    end
    it 'should be valid' do
      expect(@category.icon).to eq '123.png'
    end
  end
end
