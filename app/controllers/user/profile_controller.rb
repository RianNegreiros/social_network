class User::ProfileController < UserController

  def show
    @post = Post.new
  end

  def potenical_to_follow
    @potenical_to_follow = User.potenical_to_follow(current_user)
  end
end