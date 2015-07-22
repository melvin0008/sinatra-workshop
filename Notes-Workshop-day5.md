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

##Bundler  
[Bundler](http://bundler.io/) provides a consistent environment for Ruby projects by tracking and installing the exact gems and versions that are needed. 

Bundler is an exit from dependency hell, and ensures that the gems you need are present in development, staging, and production. Starting work on a project is as simple as ```bundle install```.

So install bundler
```sh
gem install bundler
```

Now create a file name it Gemfile and copy your dependecies.(It doesn't have an extension)
```sh
source 'https://rubygems.org'
ruby '2.1.5'

gem 'sinatra',            '1.4.5'
gem 'rest_client',		  '1.8.2'
gem 'json',				  '1.8.1'
```

Now run ```bundle install``` on your terminal

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

Heroku needs a Procfile to start your server. So you will need to type the command you use to start your server inside your Procfile.

Create a file and name it Procfile. (It doesn't have an extension)
Copy this line in your Procfile to run dynamic_urls.rb
```sh
web: ruby dynamic_urls.rb
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


##Templates 
Till now we were rendering only a line with the output. But we want our websites to look good. So enter Templates!

Ruby can include many templating systems . The one which we will look is erb (Embedded Ruby). Stuart wrote an amazing [tutorial](http://www.stuartellis.eu/articles/erb/) explaining erb syntax and format.


More to come ......
