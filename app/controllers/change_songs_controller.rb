class ChangeSongsController < ApplicationController
  def update
    if params[:song][:currentid].present?
      @song = Song.find(params[:song][:currentid])
    else
      @song = Song.find(params[:id])
    end

    @song.update(song_params)
    redirect_to users_project_path(@song.project.uuid)
  end

  private

  def song_params
    params.require(:song).permit(:id, :url)
  end
end
