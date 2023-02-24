require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    @user = User.new(name: 'Faranosh', email: 'faranosh.amini4@gmail.com', password: '123456789')
    @user.confirm
    @category = Category.create(name: 'Office Payments', icon: '123.png', user_id: @user.id)
    @expense = Expense.create(name: 'Overtime Payment', amount: 200, created_at: Time.now,
                              updated_at: Time.now, category_id: @category.id, user_id: @user.id)
  end
  describe 'Testing the index method of Transaction controller' do
    it 'should be valid' do
      expect(@expense).to be_valid
    end
    it 'should give transaction name' do
      expect(@expense.name).to eq 'Overtime Payment'
    end
    it 'should give transaction amount' do
      expect(@transaction.amount).to eq 200
    end
  end
end
