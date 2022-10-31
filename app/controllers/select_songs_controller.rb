class SongSelectsController < ApplicationController
  before_action :set_song, only: %i[create update]

  def create
  end

  def update
    @song = Song.find(params[:song][:id])
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end
end
