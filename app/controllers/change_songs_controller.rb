class ChangeSongsController < ApplicationController
  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    redirect_to request.referer
  end

  private

  def song_params
    params.require(:song).permit(:id, :url)
  end
end
