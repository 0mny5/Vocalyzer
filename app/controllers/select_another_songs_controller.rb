class SelectAnotherSongsController < ApplicationController
  def select_another_song
    @song_url = Song.find(params[:song_id]).url
    respond_to do |format|
      format.js
    end
  end
end
