require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET users/:user_id/posts' do
    before :each do
      get user_posts_path(user_id: 20)
    end
    it 'responds with status 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders the posts/index view' do
      expect(response).to render_template('posts/index')
    end

    context 'with render_views enabled' do
      it 'renders view with posts text in the index template' do
        expect(response.body).to include('Posts')
      end
    end
  end

  describe 'GET' do
    before :each do
      get user_post_path(user_id: 20, id: 2)
    end
    it 'responds with status 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders the posts/show view' do
      expect(response).to render_template('posts/show')
    end

    context 'with render_views enabled' do
      it 'renders view with post#2 text in the show template' do
        expect(response.body).to include('Posts#2')
      end
    end
  end
end
