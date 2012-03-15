require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'slim'
require 'haml'
require 'mongoid'
require './application'


run Application
