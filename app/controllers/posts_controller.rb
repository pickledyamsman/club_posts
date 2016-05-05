class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!
  skip_load_and_authorize_resource


  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to club_path(@post.club), notice: "Your post was successful!"
    else
      redirect_to :back
    end
  end

  def new
    @post = Post.new
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
  end

  def destroy
    @post.destroy
    redirect_to club_path(@post.club), notice: "Your post successfuly deleted!"
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
