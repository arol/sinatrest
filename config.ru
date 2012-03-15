require 'rubygems'
require 'sinatra'
require 'slim'
require 'haml'
require 'mongoid'
require 'rufus/scheduler'
require './application'


run Application
