class SelectSongsController < ApplicationController

  def select_song
    @song_url = Song.find(params[:song_id]).url
    respond_to do |format|
      format.js
    end
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:id)
  end
end
