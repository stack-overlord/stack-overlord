require 'json'
require 'rest_client'

at_exit do
  if $!
    error = {
      message: $!.message,
      error_class: $!.class
    }
    error = error.to_json
    # RestClient.post "http://cryptic-ocean-2225.herokuapp.com/gawks", error, :content_type => :json, :accept => :json
    url = "https://api.stackexchange.com/2.2/search/advanced?order=desc&sort=votes&q=#{error[:error_class]}&site=stackoverflow"
    response = RestClient.get(url)
    p response
  end
end

1/0
