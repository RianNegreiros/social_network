class User::TimelineController < UserController

  def index
    @posts = Post.where(user_id: current_user.following.pluck(:id)).order(created_at: :desc)
    @comments = Comment.new
  end
end