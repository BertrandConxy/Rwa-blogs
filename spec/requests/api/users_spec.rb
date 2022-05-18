require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
    path '/api/v1/users/login' do
        post 'Authentication to get jwt token' do
            tags 'User'
            consumes 'application/json'
            parameter name: :params, in: :body, schema: {
                type: :object,
                properties: {
                    email: { type: :string },
                    password: { type: :string }
                },
                required: [ 'email', 'password' ]   
            }
            response '200', 'Login Successful' do
                @user = User.create(name:'Ben', email: 'bob@example.com', password: 'password')
                    email = @user.email
                    password = @user.password
                let(:params) { { email: email, password: password  } }
                run_test! do |response|
                    data = JSON.parse(response.body)
                    expect(data['token']).not_to be_empty
                end
            end

            response '401', 'Unauthorized' do
                let(:params) { { email: 'johndoe@gmail.com', password: 'sample' } }
                run_test! 
            end
        end
    end
end
