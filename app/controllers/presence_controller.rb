class PresenceController < ApplicationController
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

    # Hard-coded channel data for the example.
    # In a real application this would be generated based the on the current app user.
    channel_data = {
      user_id: "user_#{rand(36**5).to_s(36)}",
      user_info: {
        website: 'https://pusher.com',
        company: 'Pusher',
        job_title: 'Developer Evangelist',
        is_active: true,
        email: 'jack@pusher.com'
      }
    }

    auth = Pusher[channel_name].authenticate(socket_id, channel_data)

    render json: auth
  end
end
