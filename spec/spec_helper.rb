RACK_ENV = "test"
require File.join(File.dirname(__FILE__), "..", "app.rb")
require "rack/test"
require "rspec"
require 'capybara'
require 'capybara/rspec'
require "sinatra/activerecord"
require 'capybara/dsl'

ActiveRecord::Base.logger.level = 1

set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

module RSpecMixin
    include Rack::Test::Methods
    include Capybara::DSL
    def app()
        BlogApp
    end
end

RSpec.configure do |conf|
    conf.treat_symbols_as_metadata_keys_with_true_values = true
    conf.run_all_when_everything_filtered = true
    conf.filter_run :focus
    conf.order = 'random'
    conf.include RSpecMixin
end
