class User::SubscriptionController < UserController

  def follow
    user_to_follow = User.find_by(id: params[:id])

    Subscription.create(followed_by: current_user, followed: user_to_follow)

    redirect_to user_potential_to_follow_path
  end

  def unfollow
    user = User.find_by_id(id: params[:id])

    subscription = Subscription.find_by(followed_by: current_user, followed: user)
    subscription.destroy

    redirect_to user_following_path
  end

  def followers
    @followers = current_user.followers
  end
end