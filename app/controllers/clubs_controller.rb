class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]

  def index
    if params[:user_id]
      @clubs = User.find(params[:user_id]).clubs
    else
      @clubs = Club.all
    end
  end

  def show
    @club = Club.find(params[:id])
  end

  def new
    @club = Club.new
  end

  def edit
  end

  def create
    @club = Club.create(club_params)
    if @club.save
      redirect_to @club
    else
      render new_club_path
    end
  end

  def update
    if @club.update(club_params)
      redirect_to @club, notice: "Club updated"
    else
      render :edit
    end
  end

  def destroy
    @club.destroy
    respond_to do |format|
      format.html { redirect_to clubs_url, notice: 'Club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_club
      @club = Club.find(params[:id])
    end

    def club_params
      params.require(:club).permit(:name, :description, :members, :user_id)
    end
end
