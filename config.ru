require 'rubygems'
require 'sinatra'
require 'slim'
require 'haml'
require 'mongoid'
require './application'
require 'rufus/scheduler'

run Application
