require 'swagger_helper'

RSpec.describe 'api/posts', type: :request do
        path '/api/v1/user/post/comments' do
    
            get 'List of comments for a particular user' do
              tags 'Comments'
              produces 'application/json'
              consumes 'application/json'
                parameter name: :Authorization, :in => :header, :type => :string
                parameter name: :params, in: :body, schema: {
                    type: :object,
                    properties: {
                        author_id: { type: :integer },
                        post_id: { type: :integer }
                    },
                    required: [ 'author_id', 'post_id' ]   
                }
              security [ JWT: {} ]
              response '200', 'Comments list' do
                @user = User.create( id: 8, name: 'Ben thomson', email: 'bob@gmail.com', password: 'benthmson')
                u = @user.id
                @post = Post.create( author_id: u, title: 'Sample Post', text: 'Sample Text')
                p = @post.id
                @comment = Comment.new(text: 'wow')
                @comment.author_id = u
                @comment.post_id = p
                @comment.save
                let(:'Authorization') { 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo4LCJleHAiOjE2NTM0ODkyMDh9.Fc-9G0WTQbrg4BmBUiLFzVWWzdbUMa1GHeQfecklG2E' }
                let(:params) { {post_id: p, author_id: u } }
                run_test!
              end
    
              response '404', 'post not found' do
                let(:'Authorization') { 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo4LCJleHAiOjE2NTM0ODkyMDh9.Fc-9G0WTQbrg4BmBUiLFzVWWzdbUMa1GHeQfecklG2E' }
                let(:params) { {} }
                run_test!
              end
            end
          end
    
  path '/api/v1/user/post/new_comment' do

        post 'user comment on a particular post, ensure to add token as Authorization header' do
          tags 'Post Comment'
          produces 'application/json'
          consumes 'application/json'
            parameter name: :Authorization, :in => :header, :type => :string
            parameter name: :params, in: :body, schema: {
                type: :object,
                properties: {
                    text: { type: :string },
                    post_id: { type: :integer }
                },
                required: [ 'post_id', 'text' ]   
            }
          security [ JWT: {} ]
          response '200', 'Post user comment, ensure to add token as Authorization header' do
                @user = User.create( id: 8, name: 'Ben thomson', email: 'bob@gmail.com', password: 'benthmson')
                u = @user.id
                @post = Post.create( author_id: u, title: 'Sample Post', text: 'Sample Text')
                p = @post.id
            let(:'Authorization') { "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo4LCJleHAiOjE2NTM0ODkyMDh9.Fc-9G0WTQbrg4BmBUiLFzVWWzdbUMa1GHeQfecklG2E" }
            let(:params) { {post_id: p, text: 'Sample comment to post' } }
            run_test!
          end

          response '404', 'post not found' do
            let(:'Authorization') { "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo4LCJleHAiOjE2NTM0ODkyMDh9.Fc-9G0WTQbrg4BmBUiLFzVWWzdbUMa1GHeQfecklG2E" }
            let(:params) { {} }
            run_test!
          end
        end
      end   
end
