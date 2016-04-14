get '/' do
  # Look in app/views/index.erb
  if ( session[:user_id] != nil )
    redirect '/users'
  else
    @user = User.new
    erb :index
  end
end
