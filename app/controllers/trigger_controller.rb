class TriggerController < ApplicationController
  def index
    @pusher_app_key = ENV['PUSHER_CHAT_APP_KEY']
  end

  def create
    message = params["message"]

    # TODO: implement checks to determine if the user is:
    # 1. Authenticated with the app
    # 2. Allowed to trigger on the channel
    # 3. Sanitize any additional data that has been recieved and is to be used
    # If so, proceed...

    event_data = { message: message }

    Pusher.trigger('my-channel', 'my-event', event_data)

    head :ok
  end
end
