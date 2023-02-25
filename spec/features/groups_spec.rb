require 'rails_helper'

RSpec.describe 'Groups', type: :feature do
  before(:each) do
    @user = User.new(name: 'Faranosh', email: 'faranosh.amini4@gmail.com', password: '123456789')
    @user.confirm
    @category = Group.create(name: 'school Payments', icon: '123.png')
    visit new_user_session_path
    fill_in 'Email', with: 'faranosh.amini4@gmail.com'
    fill_in 'Password', with: 'Faranosh'
    click_button 'Log in'
  end
  describe 'Testing index view of groups' do
    it 'should contain page heading' do
      expect(page).to have_content 'CATEGORIES'
    end
    it 'should contain sign out button' do
      expect(page).to have_content 'Sign out'
    end
    it 'should have category name' do
      expect(page).to have_content 'school Payments'
    end
    it 'should have category name' do
      expect(page).to have_content '$0'
    end
  end

  describe 'Testing new view of groups' do
    before(:each) { click_link 'Create Category' }
    it 'should have name field' do
      expect(page).to have_field(type: 'text')
    end
    it 'should have file field' do
      expect(page).to have_field(type: 'file')
    end
    it 'should have submit field' do
      expect(page).to have_button(type: 'submit')
    end
  end
end
