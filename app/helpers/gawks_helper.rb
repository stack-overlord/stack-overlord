module GawksHelper
  def broadcast(mash, partial_gawk)
    channel = "/#{mash}"
    message = {:channel => channel, :data => partial_gawk[0]}
    uri = URI.parse("http://localhost:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end
