require 'roda'
require 'tilt/haml'
require 'sequel'
require 'bcrypt'
require 'rack/protection'

module RodaAlpha
  class App < Roda
    #use Rack::Session::Cookie, :secret => ENV['SECRET']
    plugin :render, :engine=>'haml'

    database = 'alpha_dev'
    user     = ENV["PGUSER"]
    password = ENV["PGPASSWORD"]
    DB = Sequel.connect(adapter: "postgres",
                        database: database,
                        host: "127.0.0.1",
                        user: user,
                        password: password)

    Sequel::Model.plugin :validation_helpers

    use Rack::Session::Cookie, secret: "FG2HH4YTV6C7E8RJH9F0RDC3I4I50YGf6gh5uyd76hgrf5GGF3FDG5HJJ6N66G7gfD567",
                               key: "_roda_alpha_session"
    use Rack::Protection
    plugin :csrf

    require './models/user.rb' 

    route do |r|
      # GET / request
      r.root do
        r.redirect "/hello"
      end

      # /hello branch
      r.on "hello" do
        # Set variable for all routes in /hello branch
        @greeting = 'Hello'

        # GET /hello/world request
        r.get "world" do
          #"#{@greeting} world!"
          view 'foo'
        end

        # /hello request
        r.is do
          # GET /hello request
          r.get do
            #"#{@greeting}!"
            view 'bar'
          end

          # POST /hello request
          r.post do
            puts "Someone said #{@greeting}!"
            r.redirect
          end
        end
      end
    end
  end
end
