Documentation for sinatra [http://www.sinatrarb.com/intro.html](http://www.sinatrarb.com/intro.html) 


##Installing RubyGems

If you are using Ubuntu 12.04   
```sh
sudo apt-get install rubygems
```
If you are using Ubuntu 14.04
```sh
sudo apt-get install rubygems-integration
```
If none of the above work try following [these](https://docs.rubygems.org/pages/download) steps.

After Gem is installed type
```sh
gem -v
```
It should show a version. Preferably 2.4+ 

##Install Sinatra

Install Sinatra using gem

```sh
gem install sinatra
```

##Hello World

Create a file helloworld.rb
and write this

```ruby
require 'sinatra'
get '/' do
    "Bazinga!"
end
```

Then fire up terminal and type
```sh
ruby helloworld.rb
```
Got to [http://127.0.0.1:4567/](http://127.0.0.1:4567/)
You should get Bazinga :p

##Learn Json and REST API

Create a file learn_json_rest.rb

```ruby
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

```


Then fire up terminal and type
```sh
ruby learn_json_rest.rb
```
Got to [http://127.0.0.1:4567/](http://127.0.0.1:4567/)
You should get the exchange rate! 


Untill next Time Now!!!



Important Links:   
-[Json View Chrome](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc?hl=en)
-[Json View Firefox](https://addons.mozilla.org/en-us/firefox/addon/jsonview/)

Problems
-[Sachin's Currency Converter](http://the-currency-converter.herokuapp.com/)
-[SkySports Api](https://github.com/melvin0008/skysportsapi)