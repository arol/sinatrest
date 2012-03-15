require 'mongoid'

class Tweet
  include Mongoid::Document
  field :screen_name
  field :status  
end