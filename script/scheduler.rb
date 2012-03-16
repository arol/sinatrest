#!/usr/bin/env ruby

root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
Dir.chdir(root)

require 'rubygems'
gem 'daemons'
require 'daemons'

options = {
    :dir_mode   => :normal,
    :dir        => File.join(root, 'log'),
    :log_output => true,
    :backtrace  => true,
    :multiple   => false
}

Daemons.run_proc("scheduler", options) do

  Dir.chdir(root)
  require(File.join(root, 'config', 'environment'))

  scheduler = Rufus::Scheduler.start_new
  scheduler.every '1s', :blocking => true  do
    @tweet = Tweet.new(:screen_name=>"sergijonama",:lat=>1.2238293829382,:lon=>10.2238293829382,:time=>'03/04/2012 21:43:45',:num_retweets=>25, :status=>"Si no lo veo no lo creo")     
    @tweet.save
    puts 'saved'
  end

end