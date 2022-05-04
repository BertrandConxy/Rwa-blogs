require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /' do
    before :each do
      get users_path
    end

    it 'responds with status 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders the users/index view' do
      expect(response).to render_template('users/index')
    end

    context 'with render_views enabled' do
      it 'renders view with home page text in the index template' do
        expect(response.body).to include('Home page')
      end
    end
  end

  describe 'GET /users/:id' do
    before :each do
      get user_path(id: 20)
    end

    it 'responds with status 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders the users/show view' do
      expect(response).to render_template('users/show')
    end

    context 'with render_views enabled' do
      it 'renders view with User profile text in the show template' do
        expect(response.body).to include('User profile')
      end
    end
  end
end
