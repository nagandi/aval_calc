require 'sinatra'
require_relative 'credit_calc'

get '/' do 
	erb :index
end

post '/result' do
    if params[:howtopay] == "standart"
 	    @result = CreditCalc.new(params[:term], params[:perc],params[:summa])
 	  elsif params[:howtopay] == "annuitet" 	  	
   		@result = AnnuitetCredit.new(params[:term], params[:perc],params[:summa])
    end
    @result.calc
    erb :result_form
end  

not_found do
  status 404
  "в молоко"
end
