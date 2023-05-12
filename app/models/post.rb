class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, :description, presence: true

  after_create_commit -> { broadcast_prepend_to "posts", partial: "posts/post", locals: { post: self }, target: "posts" }
end
