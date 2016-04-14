get '/positions/new' do
  @user = User.find(session[:user_id])
  @position = Position.new
  if @user && request.xhr?
    erb :'_form/_positions_new', layout: false
  else
    erb :'_form/_positions_new'
  end
end

post '/positions' do
  @user = User.find(session[:user_id])
  # user select right portfolio
  @portfolio = @user.portfolios.find_by(name: params[:portfolio_name])
  @stock = Stock.find_by(symbol: params[:symbol])
  @position = @portfolio.positions.create(stock_id: @stock.id, quantity: params[:quantity], price: params[:price])

  if @user && request.xhr?
    @position
  else
    redirect '/users'
  end
end

# Show the Edit form
get '/position/:id/edit' do
  @user = User.find(session[:user_id])
  @portfolio = @user.portfolios.find(session[:current_portfolio_id])
  @position = @portfolio.positions.find(params[:id])

  if @user && request.xhr?
    erb :'_form/_positions_edit', layout: false
  else
    erb :'_form/_positions_edit'
  end
end



# Update position for user choice
put '/positions/:id' do
  @user = User.find(session[:user_id])
  @portfolio = @user.portfolios.find(session[:current_portfolio_id])
  @position = @portfolio.positions.find(params[:id])
  @position.assign_attributes(params[:position])
  if @user && request.xhr?
    if @position.save
      @position
    end
  else
    redirect '/users'
  end
end

# Delete selected position for a portfolio
delete '/positions/:id' do
  @user = User.find(session[:user_id])
  @portfolio = @user.portfolios.find(session[:current_portfolio_id])
  @position = @portfolio.positions.find(params[:id])
  if @user && request.xhr?
    @position.destroy
  else
    redirect '/users'
  end
end