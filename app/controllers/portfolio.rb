# Get to the portfolio create form
get '/portfolios/new' do
  @user = User.find(session[:user_id])
  @user.portfolios.new
  if @user && request.xhr?
    erb :'_form/_portfolios_new', layout: false
  else
    erb :'_form/_portfolios_new'
  end
end


# Create a new portfolio
post '/portfolios' do
  @user = User.find(session[:user_id])
  @portfolio = @user.portfolios.create(name: params[:name])

  if @user && request.xhr?
    @portfolio.to_json
  else
    redirect '/users'
  end
end

get '/portfolios/:id' do
  @user = User.find(session[:user_id])
  @portfolio = @user.portfolios.find_by(name: params[:portfolio_name])
  session[:current_portfolio_id] = @portfolio.id
  
  if @user && request.xhr?
    erb :'_form/_portfolios_show', layout: false
  else
    redirect '/users'
  end
end