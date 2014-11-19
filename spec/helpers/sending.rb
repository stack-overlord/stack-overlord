require 'json'
require 'rest_client'
require 'macaddr'
require 'encrypted_strings'

at_exit do
 if $!
   error = {
     message: $!.message,
     error_class: $!.class
   }
   error = error.to_json
   # RestClient.post "http://cryptic-ocean-2225.herokuapp.com/gawks", error, :content_type => :json, :accept => :json
   RestClient.post "http://localhost:3000/gawks", error, :content_type => :json, :accept => :json
 end
end



def foo
  900 / 0
end

# foo
puts hashed_mac = Mac.addr.encrypt
