require 'rails_helper'

RSpec.describe Expense, type: :request do
  before(:each) do
    @user = User.create(name: 'Faranosh', email: 'faranosh.amini4@gmail.com', password: '123456789')
    @category = Group.create(name: 'school Payments', icon: '123.png')
    @expense = Expense.create(name: 'fulltime Payment', amount: 500,
                              group_id: @group_id, user_id: @user.id)
    get group_expenses_path(@group)
  end
  describe 'Testing the index method of Expense controller' do
    it 'should have http status ok' do
      expect(response).to have_http_status :ok
    end
    it 'should render index page' do
      expect(response).to render_template :index
    end
    it 'should have some html' do
      expect(response.body).to include 'EXPENSES'
    end
  end

  describe 'Testing the new method of   controller' do
    before(:each) { get new_group_expense_path(@category) }
    it 'should have http status ok' do
      expect(response).to have_http_status :ok
    end
    it 'should render new page' do
      expect(response).to render_template :new
    end
    it 'should have some html' do
      expect(response.body).to include '<h3 class="nav_heading">CREATE Expenses</h3>'
    end
  end
end
