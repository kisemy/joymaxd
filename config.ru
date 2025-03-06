# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

ENV['RAILS_ENV'] = ENV['RACK_ENV']  if !ENV['RAILS_ENV'] && ENV['RACK_ENV'] 
