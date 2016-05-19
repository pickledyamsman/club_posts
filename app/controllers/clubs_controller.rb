class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html, :js, :json

  def index
    @clubs = Club.all
    respond_with(@clubs)
  end

  def show
    @club = Club.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @club }
    end
  end

  def new
    @club = Club.new
    3.times {@club.members.build}
    respond_with(@club)
  end

  def edit
    3.times {@club.members.build}
  end

  def create
    @club = Club.new(club_params)
    flash[:notice] = 'Club was successfully created.' if @club.save
    respond_with(@club)
  end

  def update
    flash[:notice] = 'Club successfully updated.' if @club.update(club_params)
    respond_with(@club)
  end

  def destroy
    @club.destroy
    respond_with(@club)
  end

  private
    def set_club
      @club = Club.find(params[:id])
    end

    def club_params
      params.require(:club).permit(
        :name, 
        :description,
        :member_number, 
        :type_id,
        :posts,
        members_attributes: [:id, :name, :position, :_destroy])
    end
end
