require 'teaspoon/controller'

module Teaspoon
  class Engine < Rails::Engine
    initializer "teaspoon.controller_methods" do
      Rails.root.join('config','teaspoon.yml').tap do |yml|
        if File.exists?(yml)
          @url = YAML.load_file(yml).fetch("url")
          @username = YAML.load_file(yml).fetch("username")
          @password = YAML.load_file(yml).fetch("password")
        end
      end

      $client = Teaspoon::Client.new(@url, @username, @password)
      puts $client.inspect

      if defined?(ActionController::Base)
        ActionController::Base.send(:include, Teaspoon::Controller)
      end
    end
  end
end
