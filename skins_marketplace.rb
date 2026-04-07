# This file is used for running the application locally
# Run with: ruby skins_marketplace.rb

require 'bundler/setup'
Bundler.require

# Simple Rails-like server
require 'webrick'
require 'sqlite3'
require 'active_record'

# Database connection
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.sqlite3'
)

# Load models
Dir['app/models/*.rb'].each { |f| require File.expand_path(f) }

# Start server
puts "Starting SkinsMonkey server..."
puts "Open http://localhost:3000 in your browser"

server = WEBrick::HTTPServer.new(:Port => 3000, :DocumentRoot => ".")

trap 'INT' do
  server.shutdown
end

server.start
