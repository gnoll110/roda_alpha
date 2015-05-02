require "roda"
require 'tilt/haml'

module RodaAlpha
  class App < Roda
    #use Rack::Session::Cookie, :secret => ENV['SECRET']
    plugin :render, :engine=>'haml'

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
