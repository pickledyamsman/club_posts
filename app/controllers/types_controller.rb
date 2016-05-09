class TypesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @type = Type.new
  end

  def create
    @type = Type.new(type_params)
    @type.save
  end

  def show
    @type = Type.find_by(id: params[:id])
    redirect_to clubs_path, alert: "Type not found." unless !!@type
  end

  private
    def type_params
      params.require(:type).permit(:name)
    end
end
