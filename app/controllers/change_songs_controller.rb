class ChangeSongsController < ApplicationController
  before_action :set_current_song, only: %i[update]

  def update
    if selectid.present?
      @song.selectstate_1 = false
      @song.save

      @song = Song.find(selectid)
      @song.assign_attributes(
        url: params[:song][:url],
        selectstate_1: true
      )
      @song.save!

      redirect_to users_project_analyze_path(@song.project.uuid)
    elsif another_selectid.present?
      @song.selectstate_2 = false
      @song.save

      @song = Song.find(another_selectid)
      @song.assign_attributes(
        url: params[:song][:url],
        selectstate_2: true
      )
      @song.save!

      redirect_to users_project_analyze_another_path(@song.project.uuid)
    else
      @song.update(song_params)

      redirect_to request.referer
    end
  end

  private

  def set_current_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:id, :url)
  end

  def selectid
    params[:song][:selectid]
  end

  def another_selectid
    params[:song][:another_selectid]
  end
end
