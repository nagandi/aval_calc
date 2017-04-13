require 'sinatra'
require_relative 'credit_calc'

get '/' do 
	erb :index
end