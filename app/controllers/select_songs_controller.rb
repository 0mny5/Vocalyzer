class SelectSongsController < ApplicationController
  def update
    @song = Song.find(params[:song][:id])
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end
end
