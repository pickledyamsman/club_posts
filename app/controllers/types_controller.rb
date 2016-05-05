class TypesController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @type = Type.find_by(id: params[:id])
    redirect_to clubs_path, alert: "Type not found." unless !!@type
  end
end
