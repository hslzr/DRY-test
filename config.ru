require 'sinatra/base'
require 'sinatra/json'

Bundler.require(:default)
Dir.glob('./config/*.rb').each {|file| require file}
Dir.glob('./{controllers,validators,models}/*.rb').each {|file| require file}

map('/items') { run ItemsController }
map('/') { run RootController }
