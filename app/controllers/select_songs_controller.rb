class SelectSongsController < ApplicationController
  def update
    @song = Song.find(params[:song][:id])
    @project = @song.project

    render "users/projects/show", song: @song, project: @project
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:id)
  end
end
