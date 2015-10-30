class PrivateController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :auth

  def index
    @pusher_app_key = ENV['PUSHER_CHAT_APP_KEY']
  end

  def auth
    # TODO: implement checks to determine if the user is:
    # 1. Authenticated with the app
    # 2. Allowed to subscribe to the `channelName`
    # 3. Sanitize any additional data that has been recieved and is to be used
    # If so, proceed...

    socket_id = params["socket_id"]
    channel_name = params["channel_name"]

    auth = Pusher[channel_name].authenticate(socket_id)

    render json: auth
  end
end
