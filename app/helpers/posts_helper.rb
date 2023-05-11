module PostsHelper
  def post_liked?(post, user)
    @like = Like.where(post_id: post.id, user_id: user.id)
    @like.present?
  end
end
