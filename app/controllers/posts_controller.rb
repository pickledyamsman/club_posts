class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html, :js

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def create
    @post = Post.new(post_params)
    flash[:notice] = 'Post was successfully created.' if @post.save
    respond_with(@post)
  end

  def edit
  end

  def update
    flash[:notice] = 'Club successfully updated.' if @post.update(post_params)
    respond_with(@post)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post.destroy
    respond_with(@post)
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
