class TypesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @types = Type.all
    @type = Type.new
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @types }
    end
  end

  def new
    @type = Type.new
  end

  def create
    @type = Type.new(type_params)
    if @type.save
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @type, status: 201}
        format.js {}
      end
    else
      render :index
    end
  end

  def show
    @type = Type.find_by(id: params[:id])
    respond_to do |format|
      format.html { render :show}
      format.json { render json: @type }
      format.js {}
    end
  end

  def edit
  end

  def update
    if @type.update(type_params)
      redirect_to types_path
    else
      render :edit
    end
  end

  def destroy
    @type.destroy
    redirect_to types_path
  end

  private
    def type_params
      params.require(:type).permit(:name)
    end
end
