require './app/chitter'

run Sinatra::Application

use Rack::Static,
  :urls => ["/stylesheets"],
  :root => "public"

