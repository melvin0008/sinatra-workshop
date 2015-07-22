require 'sinatra'
require 'json'
require 'rest_client'

get '/:message' do
    message=params['message'].split(' ')
    if message.length ==2   
        countryfrom=message[0].upcase
        countryto=message[1].upcase
        parameter="#{countryfrom}_#{countryto}"
        query="http://free.currencyconverterapi.com/api/v3/convert?q=#{parameter}&compact=y"
        begin
            api_result = RestClient.get query
            dict_result=JSON.parse(api_result)
        rescue Exception
            erb :errorPage
        end
        return_val= "1 #{countryfrom} => #{dict_result[parameter]['val']} #{countryto}"
        erb :success, :locals => { :returnval => return_val }  
    else
        erb :errorPage
    end 
end

get '/' do
     erb :errorPage
end
