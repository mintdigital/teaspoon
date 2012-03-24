require 'net/http'
require 'json'

module Teaspoon
  class Client
    def initialize(url, username=nil, password=nil)
      @uri = URI.parse(url)
      @username = username
      @password = password
    end

    def send(message, submessage, opts={})
      params = {:message => message, :submessage => submessage}
      params[:timestamp] = opts[:timestamp] if opts[:timestamp]
      params[:image] = opts[:image] if opts[:image]
      if opts[:colour] || opts[:color]
        params[:colour] = (opts[:colour] || opts[:color])
      end

      http = Net::HTTP.new(@uri.host, @uri.port)
      req = Net::HTTP::Post.new(@uri.request_uri)
      req.body = params.to_json
      req.basic_auth @username, @password if @username && @password
      res = Net::HTTP.new(@uri.host, @uri.port).start {|http| http.request req}
    end
  end
end
