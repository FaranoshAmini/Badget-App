require 'rails_helper'
RSpec.describe Expense, type: :model do
  before(:each) do
    @user = User.new(name: 'Faranosh', email: 'faranosh.amini4@gmail.com', password: '123456789')
    @category = Group.create(name: 'school Payments', icon: '123.png')
    @expense = Expense.create(name: 'fulltime Payment', amount: 500)
  end
  describe 'Testing the index method of Transaction controller' do
    it 'should give transaction name' do
      expect(@expense.name).to eq 'fulltime Payment'
    end
    it 'should give transaction amount' do
      expect(@expense.amount).to eq 500
    end
  end
end
