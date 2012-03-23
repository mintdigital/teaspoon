module Teaspoon::Controller
  def spoon(message="Teaspoon!", submessage="message from teaspoon", opts={})
    t ||= Teaspoon.new('http://mint-source-staging.herokuapp.com/endpoint', 'username', 'password')
    t.send(message, submessage, opts)
  end
end

if defined?(ActionController::Base)
  ActionController::Base.send :include, Teaspoon::Controller
end
