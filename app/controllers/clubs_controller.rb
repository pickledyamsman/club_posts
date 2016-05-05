class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @clubs = Club.all
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
    @club = Club.new(club_params)
    if @club.save
      redirect_to club_path(@club), notice: 'Club was successfully created.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to @club, notice: 'Club was successfully updated.' }
        format.json { render :show, status: :ok, location: @club }
      else
        format.html { render :edit }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
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
      params.require(:club).permit(
        :name, 
        :description,
        :member_number, 
        :type_id,
        :category_id,
        members_attributes: [:name, :position])
    end
end
