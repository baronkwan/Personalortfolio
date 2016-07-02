
get '/getQuote' do
  # Set up ENV variable to protect the API key
  symbol = params[:symbol]
  APILINK = "http://marketdata.websol.barchart.com/getQuote.json?key=" + ENV['MARKETDATA_API'] +"&symbols="
  
  queryLink = APILINK + symbol
  # render the page with symbol and turn data to JSON and send data back by AJAX
  quoteInfo = HTTParty.get(queryLink)
  
  parsed_data = JSON.parse(quoteInfo.to_json)
  
  if (parsed_data["results"] != nil)
    p "This symbol is real! Now Check if it in our database!"
    comp_name = parsed_data["results"][0]["name"]
    if !(Stock.exists? symbol: symbol) 
      p '-'*50
      p "This symbol does not exist in our database, now adding..."
      p '-'*50
      new_stock = Stock.create(symbol: symbol, name: comp_name)
    end
  end

  if request.xhr?
    quoteInfo.to_json
  else
    redirect '/users/index'
  end
end

# post '/addToProfolio' do
#   @user = User.find(session[:user_id])
#   @stock = Stock.find(symbol: params[:symbol])
#   @profolio = Profolio.create(account_id: @user.account.id, stock_id: @stock.id)
#   @user.account << @stock
#   if request.xhr?
#     @stock
#   else
#     redirect '/users/index'
#   end
# end