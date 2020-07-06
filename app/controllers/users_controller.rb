class UsersController < ApplicationController
  before_action :move_to_index

  def show
    @user = User.find(current_user.id) if current_user.id.present?
    @posts = Post.where(user_id: current_user.id)
    @likes = Like.where(user_id: current_user.id)
    @stocks = Stock.where(user_id: current_user.id)
    @answers = Response.where(user_id: current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    uimg = user_params[:uimg].presence || user.uimg
    user.update(
      uimg: uimg,
      profile: user_params[:profile]
    )
    redirect_to "/users/#{user.id}"
  end

  private

  def user_params
    params.require(:user).permit(:uimg, :profile)
  end

  def move_to_index
    redirect_to '/' unless user_signed_in?
  end
end
