require 'rubygems'
require 'sinatra'
require "sinatra/config_file"
require 'net/ping'
require 'haml'

def up?(host)
  Net::Ping::TCP.new(host, 80, 1).ping
end

class WebApp < Sinatra::Base
  register Sinatra::ConfigFile

  config_file 'config.yml'

  use Rack::Auth::Basic, "Protected Area" do |username, password|
    username == settings.username && password == settings.password
  end

  get '/' do
    redirect '/server/'
  end

  get '/server/' do
    host = settings.local_ip

    if up?(host)
      state = "Online"
      message = "Server is online"
    else
      state = "Offline"
      message = "Server is offline"
    end

    haml :index, :locals => { :state => state, :message => message }
  end

  get '/server/:state' do
    input = params['state']
    host = settings.local_ip

    if up?(host)
      state = "Online"
      message = "Server is online"
    else
      state = "Offline"
      message = "Server is offline"
    end

    if input == 'on'
      `wakeonlan "#{settings.mac_addr}"`
      message = "Magic packet sent"
    end

    haml :index, :locals => { :state => state, :message => message }
  end
end

WebApp.run!
