class PostsController < ApplicationController
  before_action :authenticate_user!
  #load_and_authorize_resource

  # def index
  #   @posts = Post.all
  # end

  def create
    if !params[:post][:content].empty?
      @post = Post.create(post_params)
      redirect_to club_path(@post.club), notice: "Your comment was successful!"
    else
      redirect_to :back
    end
  end

  # def edit
  # end

  # def update
  #   if @post.update(post_params)
  #     redirect_to user_path(@post.user), notice: "Your comment successfully updated!"
  #   else
  #     render :edit
  #   end
  #end

  def show
  end

  # def destroy
  #   @post.destroy
  #   redirect_to clubs_path, notice: "Your comment was removed."
  # end

  private
    def post_params
      params.require(:post).permit(:content, :club_id, :user_id)
    end
end
