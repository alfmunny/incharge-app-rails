class Api::V1::MessagingController < ApplicationController
  include ActionController::Live

  def index
   response.headers['Content-Type'] = 'text/event-stream'
   10.times {
     response.stream.write "This is a test Messagen"
     sleep 1
   }
   response.stream.close
  end

end
