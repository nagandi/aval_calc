require 'spec_helper'
require 'rack/test'

describe "GET '/'" do
include Rack::Test::Methods

  def app
    Sinatra::Application
  end
	it 'load mainpage' do
		get '/'
		expect(last_response).to be_ok
		expect(last_response.body).to include("Процентна ставка(%):")
		expect(last_response.body).to include("Сума кредиту:")
		expect(last_response.body).to include("Термін погашення (в місяцях):")
	end
end