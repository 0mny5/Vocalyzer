class SongsController < ApplicationController
  def index
    project = Project.find_by(id: params[:id])
    @songs = project.songs.all
  end

  def create
    project = Project.find_by(id: params[:id])
    @song = project.songs.create(song_params)


    redirect_to project_path(Project.find_by(params[:id]))
  end

  private

  def song_params
    params.require(:songs).permit(:url)
  end

end
