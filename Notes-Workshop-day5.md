We have run the required code on our localhost and we get the value for 1USD in terms of INR.   
But a real application should do much more. It should convert any currency to another currency.

##So lets make it dynamic
We take a parameter which will have the currency symbols for the countries we want to convert (from and to)
```ruby
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
		api_result = RestClient.get query
		dict_result=JSON.parse(api_result)
		return_val= "1 #{countryfrom} => #{dict_result[parameter]['val']} #{countryto}"
		return_val		
	end
end

get '/' do
    "Enter currency from and to after the / . eg. /USD INR"
end
```

We now split the message and get the required output

Now type http://127.0.0.1/USD%20INR

Now try other currencies . It should work.
##Heroku
Tired of the localhost environment ?
Want to host your code ??   
Visit [Heroku](https://www.heroku.com/). 
Sign up for free.

####Install on a Debian System(Ubuntu)
```sh
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
```
Now run the following steps on your command prompt

cd into your project folder and type
```sh
heroku login
```
####Create an app and push your code
Now login to heroku and click on create an app or the plus(+) symbol. Now write a unique app name. Remember the app name.

Firstly delete the .git file
Make sure you are in the project directory
```sh
rm -rf .git/
```
Initialize a git repo

```sh
git init
```

Add and push all files

```sh
git add .
git commit -am "Initial commit"
heroku git:remote -a <name_of_your_app>
git push heroku master
```

If you want to learn about git and github, take [this course](https://www.udacity.com/course/how-to-use-git-and-github--ud775) on udacity.

Now visit 'name_of_your_app'.herokuapp.com/USD INR    
or any such currencies.
##TxtWeb

####What it is

####How to use it

