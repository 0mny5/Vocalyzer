class ChangeSongsController < ApplicationController
  def update
    @song = Song.find(params[:id])
    @project = @song.project

    @song.update(song_params)
    render "users/projects/show", song: @song, project: @project
  end

  private

  def song_params
    params.require(:song).permit(:id, :url)
  end
end
