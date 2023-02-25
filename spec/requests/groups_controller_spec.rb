require 'rails_helper'

RSpec.describe Group, type: :request do
  before(:each) do
    @user = User.new(name: 'Faranosh', email: 'faranosh.amini4@gmail.com', password: '123456789')
    @user.confirm
    sign_in @user
    @category = Group.create(name: 'school Payments', icon: '123.png')
    @category.save
    get groups_path
  end

  describe 'Testing the index method of group controller' do
    it 'should have http status ok' do
      expect(response).to have_http_status :ok
    end

    it 'should render index page' do
      expect(response).to render_template :index
    end

    it 'should have some html' do
      expect(response.body).to include 'CATEGORIES'
    end

    it 'should have group' do
      expect(response.body).to include 'school Payments'
    end
  end
  describe 'Testing the new method of group controller' do
    before(:each) { get new_group_path }
    it 'should have http status ok' do
      expect(response).to have_http_status :ok
    end

    it 'should render index page' do
      expect(response).to render_template :new
    end

    it 'should have some html' do
      expect(response.body).to include 'CREATE CATEGORIES'
    end
  end
end