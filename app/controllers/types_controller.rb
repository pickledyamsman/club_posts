class TypesController < ApplicationController
  before_action :authorize_logged_in
  
  def show
    @type = Type.find_by(id: params[:id])
    redirect_to clubs_path, alert: "Type not found." unless !!@type
  end
end
