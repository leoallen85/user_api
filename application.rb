require File.join(File.dirname(__FILE__), 'environment')

post '/users' do
  @user = User.create(params)
  user_json
end

def user_json
  json username: @user.username, email: @user.email
end