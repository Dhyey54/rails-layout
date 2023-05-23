class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy]
  before_action :current_post, only: %i[index new create]

  def index
    @comments = current_post.comments.order(id: :desc)
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_post.comments.new(comment_params)

    if @comment.save
      respond_to do |format|
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_comments_path
  end

  private
  def comment_params
    params.require(:comment).permit(:id, :content, :user_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def current_post
    @post = Post.find(params[:post_id])
  end
end
