class User::SubscriptionController < UserController

  def follow
    user_to_follow = User.find_by(id: params[:id])

    Subscription.create(followed_by: current_user, followed: user_to_follow)

    redirect_to user_potencial_to_follow
  end
end