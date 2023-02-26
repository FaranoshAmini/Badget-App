require 'rails_helper'

RSpec.describe 'splash', type: :feature do
  before(:each) do
    @user = User.new(name: 'Faranosh', email: 'faranosh.amini4@gmail.com', password: '123456789')
    @user.confirm
    @category = Group.create(name: 'School Payments', icon: '123.png')
    @expense = Expense.create(name: 'fullPayment', amount: 500,
                              group_id: @group_id, user_id: @user.id)
    visit new_user_session_path
    fill_in 'Email', with: 'faranosh.amini4@gmail.com'
    fill_in 'Password', with: 'Faranosh'
    click_button 'Log in'
  end
  describe 'Testing index view of transaction' do
    before(:each) do
      click_link 'school Payments'
    end
    it 'should contain page heading' do
      expect(page).to have_content 'EXPENSES'
    end
    it 'should contain sign out button' do
      expect(page).to have_content 'Sign out'
    end
    it 'should have expense name' do
      expect(page).to have_content 'fulltime Time'
    end
    it 'should have expense amount' do
      expect(page).to have_content '$500'
    end
  end

  describe 'Testing new view of expense' do
    before(:each) do
      click_link 'school Payments'
      click_link 'Create expense'
    end
    it 'should have heading' do
      expect(page).to have_content 'CREATE EXPENSE'
    end
    it 'should have name field' do
      expect(page).to have_field(type: 'text')
    end
    it 'should have submit field' do
      expect(page).to have_button(type: 'submit')
    end
  end
end
