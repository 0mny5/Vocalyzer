class SelectSongsController < ApplicationController
  def update
    @song = Song.find(params[:song][:id])
    redirect_to users_project_path(@song.project.uuid)
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:id)
  end
end
