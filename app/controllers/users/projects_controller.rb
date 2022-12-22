class Users::ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  def index
    @projects = current_user.projects
  end

  def show
    @song = @project.songs.find_by(selectstate_1: :true)
    if @song.present?
      @song
    else 
      @song = @project.songs.first
    end
  end

  def new
    @project = current_user.projects.new
    @project.songs.build 
  end

  def create
    @project = current_user.projects.new(project_params)
    @project.songs.each.with_index(1) do |s, idx|
      s.song_label = "Song#{idx}"
    end

    if @project.save
      redirect_to users_project_url(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    return render :edit unless (2..10).cover?(destroy_attribute_counts)

    @project.assign_attributes(project_params)
    reset_index = @project.songs.reject {|key| key._destroy != false}
    reset_index.each.with_index(1) do |s, idx|
      s.song_label = "Song#{idx}" 
    end

    if @project.save
      redirect_to users_project_url(@project)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy

    redirect_to users_projects_url, success: t('.success', title: "#{@project.title}")
  end

  private

  def set_project
    @project = current_user.projects.find(params[:uuid])
  end

  def project_params
    params.require(:project).permit(:title, songs_attributes: [:id, :url, :song_label, :_destroy])
  end

  def destroy_attribute_counts
    destroy_array = []
    da2 = []

    params[:project][:songs_attributes].each do |d|
      @a = destroy_array.append(d.pop)
    end
    @a.each do |d|
      if d[:_destroy] == "false"
        @b = da2.append(d[:_destroy])
      end
    end

    @b&.size
  end
end
