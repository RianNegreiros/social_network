class User::PostsController < UserController
  skip_before_action :verify_authenticity_token

  def create
    f_params = form_params.merge(user: current_user)

    @post = Post.new(f_params)

    if @post.save
      redirect_to user_profile_path
    else
      render "user/profile/show"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    redirect_to user_profile_path
  end

  private

  def form_params
    params.require(:post).permit(:body)
  end

end