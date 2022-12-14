class CaptureController < ApplicationController
  def capture
    url = request.referer
    system("rake screen_capture:capture #{url}")

    redirect_to "https://twitter.com/share?url=#{ request.url }"
  end
end
