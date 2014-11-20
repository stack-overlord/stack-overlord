class BackendWebSocket
  KEEPALIVE_TIME = 15 # in seconds

  def initialize(app)
    @app     = app
    @clients = [] # websockets based on mashes go in here
  end

  # env = url, e.g. localhost / cryptic-ocean-2225
  def call(env)
    if Faye::WebSocket.websocket?(env)
    # WebSockets logic goes here
      ws = Faye::WebSocket.new(env, nil, {ping: KEEPALIVE_TIME })

      ws.on :open do |event|
        @clients << ws
      end

      ws.on :message do |event| # instead of each message updated client
        @clients.each {|client| client.send(event.data) }
      end

      ws.on :close do |event|
        @clients.delete(ws)
        ws = nil
      end
      # Return async Rack response
      ws.rack_response
    else
      @app.call(env)
    end
  end
end
