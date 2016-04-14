testUser0 = User.create(first_name: "Faker", last_name: "forReal", user_name: "FakerForLife0", email: "faker@gmail.com", password: 'test1234')
testUser1 = User.create(first_name: "Dave", last_name: "forReal", user_name: "FakerForLife1", email: "faker1@gmail.com", password: 'test1234')
testUser2 = User.create(first_name: "Pete", last_name: "forReal", user_name: "FakerForLife2", email: "faker2@gmail.com", password: 'test1234')
testUser3 = User.create(first_name: "Raven", last_name: "forReal", user_name: "FakerForLife3", email: "faker3@gmail.com", password: 'test1234')
testUser4 = User.create(first_name: "Forbidden", last_name: "forReal", user_name: "FakerForLife4", email: "faker4@gmail.com", password: 'test1234')


testStock0 = Stock.create(symbol: "msft", name: "Microsoft Corp.")
testStock1 = Stock.create(symbol: "ua", name: "Under Armour")
testStock2 = Stock.create(symbol: "ge", name: "General Electric portfolio")
testStock2 = Stock.create(symbol: "tsla", name: "Tesla Motors, Inc.")
testStock2 = Stock.create(symbol: "scty", name: "SolarCity Corporation")


p1 = testUser0.portfolios.create(name: "portfolio1")
p2 = testUser0.portfolios.create(name: "portfolio2")
@portfolio = testUser0.portfolios.create(name: "testingPortfolio")

@stock    = Stock.find_by( symbol: "msft")
@portfolio.positions.create( stock_id: @stock.id, quantity: 50, price: 52.25 )
@portfolio.positions.create( stock_id: 2, quantity: 100, price: 85.66 )
@portfolio.positions.create( stock_id: 4, quantity: 100, price: 85.66 )




