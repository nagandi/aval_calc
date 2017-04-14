require 'spec_helper'
require 'rack/test'

include Rack::Test::Methods

  def app
    Sinatra::Application
  end

describe "GET '/'" do

	it 'load mainpage' do
		get '/'
		expect(last_response).to be_ok
		expect(last_response.body).to include("Процентна ставка(%):")
		expect(last_response.body).to include("Сума кредиту:")
		expect(last_response.body).to include("Термін погашення (в місяцях):")
	end
end

describe "POST '/result'" do
  it "result template" do
    post '/result', perc: '10', summa: '100', term: '10'
    expect(last_response.body).to include("Результати")
  end
end

 