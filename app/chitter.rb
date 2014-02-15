require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require 'dm-timestamps'


enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
set :partial_template_engine, :erb

require_relative 'models/peep'

require_relative 'data_mapper_setup'
