require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  erb(:hello)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do

  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do

  @the_num = params.fetch("users_number").to_f

  @the_result = Math.sqrt(@the_num) 

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_apr)
end

get("/payment/results") do

  @the_apr = params.fetch("user_apr").to_f

  @the_years = params.fetch("user_years").to_f

  @the_principal = params.fetch("user_pv").to_f

  @numerator = (@the_apr/1200) * @the_principal

  @denominator = 1 - (1 + (@the_apr/1200))**(-@the_years*12)

  @the_payment = (@numerator/@denominator)

  erb(:apr_results)
end


get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
