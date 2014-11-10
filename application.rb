require File.join(File.dirname(__FILE__), 'environment')

API_KEY = '12345abc'

post '/users' do
  @user = User.create(params)
  user_json
end

get '/users/:id' do
  @user = User.get(params[:id])
  user_json
end

delete '/users/:id' do
  halt 401 unless authorized?

  @user = User.get(params[:id])
  @user.destroy

  status 204
end

def authorized?
  request.env["HTTP_AUTHORIZATION"] == API_KEY
end

def user_json
  json id: @user.id, username: @user.username, email: @user.email
end
