require 'rubygems'
require 'spork'
#require 'spork/ext/ruby-debug'

Spork.prefork do
  ENV["RAILS_ENV"] = "test"
  require File.expand_path("../../config/environment", __FILE__)
  require "rails/test_help"
  require "minitest/rails"
  require "minitest/pride"
  require "mocha/setup"

  Dir[Rails.root.join("test/support/**/*.rb")].each {|f| require f}
end

Spork.each_run do

end