ENV['RACK_ENV'] = 'test'

require 'roda_alpha'
require 'rspec'
require 'rack/test'

describe 'The Hello App' do
  include Rack::Test::Methods

  def app
    RodaAlpha::App
  end

  it 'say /' do
    get '/'
    expect(last_response.status).to eq 302
  end

  it 'say hello' do
    get '/hello'
    expect(last_response.status).to eq 200
  end

  it 'say hello world' do
    get '/hello/world'
    expect(last_response.status).to eq 200
  end
end
