env = ENV["RACK_ENV"] || "development"
# DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
# For Heroku staging: 
DataMapper.setup(:default, "postgres://nxhwfanozypvmw:mt6G6iV8q_9w9OBmFjejnijEvh@ec2-107-20-245-187.compute-1.amazonaws.com:5432/da8kn3h231bdq6")

require './app/chitter'

DataMapper.finalize
DataMapper.auto_upgrade!
