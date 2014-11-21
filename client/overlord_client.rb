require 'json'
require 'rest_client'
require 'macaddr'
require 'encrypted_strings'

at_exit do
  stack_master = Overlord.new($!) if $!
  stack_master.run
end

class Overlord
  def initialize(collected_error)
    @mash = Mac.addr.encrypt
    @error = {message: collected_error.message, error_class: collected_error.class}
  end


  def post_message
    p error = @error.to_json
    RestClient.post "http://localhost:3000/addresses/#{@mash}/gawks", error, :content_type => :json, :accept => :json
  end

  def puts_link
    puts "\e[31m Your Overlord resides here: http://localhost:3000/#{@mash} \e[0m"
  end

  def run
    self.post_message
    self.puts_link
  end

end

