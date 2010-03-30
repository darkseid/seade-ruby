require 'appengine-rack'
AppEngine::Rack.configure_app(          
    :application => "jruby-darkseid",           
    :precompilation_enabled => true,
    :version => "1")
#run lambda { Rack::Response.new("<h1>Testando uma aplicacao JRuby com Hack").finish }

require 'app'
run Sinatra::Application

