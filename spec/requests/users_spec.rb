require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /' do
    before :each do
      @user = create(:user)
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
        expect(response.body).to include(@user.name)
      end
    end
  end

  describe 'GET /users/:id' do
    before :each do
      @user = create(:user)
      get user_path(id: @user.id)
    end

    it 'responds with status 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders the users/show view' do
      expect(response).to render_template('users/show')
    end

    context 'with render_views enabled' do
      it 'renders view with User profile text in the show template' do
        expect(response.body).to include(@user.name)
      end
    end
  end
end
