class Users::ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = current_user.projects
  end

  # GET /projects/1 or /projects/1.json
  def show
    @song = @project.songs.find_by(selectstate_1: :true)
    if @song.present?
      @song
    else 
      @song = @project.songs.first
    end
  end

  # GET /projects/new
  def new
    @project = current_user.projects.new
    @project.songs.build 
  end

  # GET /projects/1/edit
  def edit; end

  # POST /projects or /projects.json
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

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    @project.assign_attributes(project_params)

    if @project.save!
      redirect_to users_project_url(@project)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    redirect_to users_projects_url, notice: "Project was successfully destroyed."
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = current_user.projects.find(params[:uuid])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:title, songs_attributes: [:id, :url, :song_label, :_destroy], song: [:id])
  end
end
