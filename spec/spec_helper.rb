RACK_ENV = "test"
require File.join(File.dirname(__FILE__), "..", "app.rb")
require "rack/test"
require "rspec"

set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

def app()
    BlogApp
end

RSpec.configure do |conf|
    conf.include Rack::Test::Methods
    conf.treat_symbols_as_metadata_keys_with_true_values = true
    conf.run_all_when_everything_filtered = true
    conf.filter_run :focus
    conf.order = 'random'
end
