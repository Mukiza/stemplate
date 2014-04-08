require 'sinatra'
require "sinatra/activerecord"

Dir["./models/*.rb"].each { |file| require file } 

set :environment, :development

class BlogApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    @posts = Post.all
    haml :index
  end
end
