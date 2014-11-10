require 'sinatra'
require 'sinatra/json'

require 'dm-core'
require 'dm-migrations'
require 'dm-validations'
require 'dm-types'

DataMapper.setup(:default, (ENV["DATABASE_URL"] || "sqlite3:///#{File.expand_path(File.dirname(__FILE__))}/#{Sinatra::Base.environment}.db"))

require './models/user'

# Perform basic sanity checks and initialize all relationships
# Call this when you've defined all your models
DataMapper.finalize

# Automatically create the user table
User.auto_upgrade!