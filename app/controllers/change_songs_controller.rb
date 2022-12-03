class ChangeSongsController < ApplicationController
  def update
    @song = Song.find(params[:id])
    @song.selectstate_1 = false
    @song.selectstate_2 = false
    @song.save

    if params[:song][:currentid].present?
      @song = Song.find(params[:song][:currentid])
      @song.assign_attributes(
        url: params[:song][:url],
        selectstate_1: true
      )
      @song.save

      redirect_to users_project_path(@song.project.uuid)
    elsif params[:song][:another_currentid].present?
      @song = Song.find(params[:song][:another_currentid])
      @song.assign_attributes(
        url: params[:song][:url],
        selectstate_2: true
      )
      @song.save

      redirect_to users_project_analyze_path(@song.project.uuid)
    else
      @song = Song.find(params[:id])
      @song.update(song_params)

      redirect_to users_project_path(@song.project.uuid)
    end
  end

  private

  def song_params
    params.require(:song).permit(:id, :url)
  end

  def initialize_select
    Song.find(params[:id]).save!(selectstate_1: :false)
  end
end
