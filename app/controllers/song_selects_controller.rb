class SongSelectsController < ApplicationController
  before_action :set_song, only: %i[create update]

  def create
  end

  def update
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end
end
