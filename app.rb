require 'sinatra'
require "sinatra/activerecord"

Dir["./models/*.rb"].each { |file| require file } 

RACK_ENV ||= ENV["RACK_ENV"] || "development"

class BlogApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    @posts = Post.all
    haml :index
  end
  get "/new" do
      "hello"
  end
end
