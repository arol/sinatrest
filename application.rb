Dir["./models/**/*.rb"].each { |model| require model }
class Application < Sinatra::Base

  configure do
    set :root, File.dirname(__FILE__)
    set :static, true

    set :template, :slim
    # Haml & Sass options
    set :sass, :style => :compressed
  end

  Mongoid.configure do |config|
    if ENV['MONGOHQ_URL']
      conn = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'])
      uri = URI.parse(ENV['MONGOHQ_URL'])
      config.master = conn.db(uri.path.gsub(/^\//, ''))
    else
      config.master = Mongo::Connection.from_uri("mongodb://localhost:27017").db('test')
    end
  end

  get '/' do
    slim :index
  end

  get '/nou_tweet' do
      @tweet = Tweet.new(:screen_name=>"arolet",:lat=>1.2238293829382,:lon=>10.2238293829382,:time=>'03/04/2012 21:43:45',:num_retweets=>25, :status=>"Si no lo veo no lo creo")
      @tweet.save
    slim :nou_tweet
  end

  get '/get_tweet' do
    @tweets = Tweet.where(:screen_name => "arolet").to_a
    slim :get_tweet
  end
  
  get '/last_tweet' do
    @tweets = Tweet.last.to_a
    slim :get_tweet
  end

  get '/stylesheets/application.css' do
    sass :application
  end

end
# 
# scheduler = Rufus::Scheduler.start_new
# ENV['flag']=false;
# scheduler.every '1s', :blocking => true  do
#   @tweet = Tweet.new(:screen_name=>"sergijonama",:lat=>1.2238293829382,:lon=>10.2238293829382,:time=>'03/04/2012 21:43:45',:num_retweets=>25, :status=>"Si no lo veo no lo creo")
#   
#   if ENV['flag'] == false
#     @tweet.save
#     ENV['flag'] = true
#     puts 'saved'
#   else
#     ENV['flag'] = false
#   end
#   
# 
# end
















