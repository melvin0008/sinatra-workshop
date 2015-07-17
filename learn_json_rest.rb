require 'sinatra'
require 'json'
require 'rest_client'



get '/' do
	countryfrom="USD"
	countryto="INR"
	parameter="#{countryfrom}_#{countryto}"
	query="http://free.currencyconverterapi.com/api/v3/convert?q=#{parameter}&compact=y"
	api_result = RestClient.get query
	dict_result=JSON.parse(api_result)
	return_val= "1 #{countryfrom} => #{dict_result[parameter]['val']} #{countryto}"
	return_val		
end