env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
require './app/chitter'

DataMapper.finalize
DataMapper.auto_upgrade!
