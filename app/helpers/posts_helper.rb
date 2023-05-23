module PostsHelper
  def post_liked?(post, user)
    Like.where(post_id: post.id, user_id: user.id).present?
  end
end
