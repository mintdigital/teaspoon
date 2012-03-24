module Teaspoon
  module Controller
    def spoon(message="PING!", submessage="from teaspoon!", opts={})
      $client.send(message, submessage, opts)
    end
  end
end
