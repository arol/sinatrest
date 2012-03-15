Sinatra Prototype
==================================

Install
---------------------
First of all run bundle to setup gems
    bundle install

Install mongodb and run it
    brew install mongodb
    mongod run --config /usr/local/Cellar/mongodb/2.0.3-x86_64/mongod.conf

Then you can run the server
    rackup config.ru

A Sinatra application
---------------------

This is a simple sinatra application for rapid web app prototyping which 
has been configured to be hosted on the amazing [Heroku Platform](http://heroku.com/).
Runs on both:
* bamboo-ree-1.8.7 stack
* bamboo-mri-1.9.2 stack 

The application comes with jQuery 1.5.1 loaded from Google Ajax Libraries

Current Gems
------------
* Sinatra
* Sinatra-mongoid
* Bson_ext ( for mongoDB performance )
* Haml ( for SASS )
* Slim
* Rspec 2
* Cucumber
* Capybara
* Rack-Test

Licence
-------

This application is released under the MIT licence.