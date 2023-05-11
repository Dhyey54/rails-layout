class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy like dislike]

  def index
    @posts = Post.order(id: :desc)
  end

  def show; end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)

    if @post.save
      respond_to do |format|
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_url(@post), notice: 'Post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.turbo_stream
    end
  end

  def like
    post = @post.likes.new(user_id: current_user.id)
    post.save
    redirect_to posts_path
  end

  def dislike
    @post.likes.find_by(user_id: current_user.id).destroy
    redirect_to posts_path
  end

  private
  def set_post
    @post = Post.includes(:likes, :comments).find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :user_id)
  end
end
