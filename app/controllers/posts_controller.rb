class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      render json: @post, status: 201, notice: "Your post was successful!"
    else
      redirect_to :back, alert: "Couldn't make your post."
    end
  end

  def new
    @post = Post.new
    @post.user_id = current_user.id
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to club_path(@post.club), notice: "Your post successfully updated!"
    else
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html { render :show}
      format.json { render json: @post }
    end
  end

  def destroy
    @post.destroy
    redirect_to club_path(@post.club), notice: "Your post successfuly deleted!"
  end

  def post_data
    post = Post.find(params[:id])
    render json: post.to_json(only: [:title, :content, :id])
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(
        :content,
        :title, 
        :club_id, 
        :user_id
      )
    end
end
