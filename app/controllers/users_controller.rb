class UsersController < ApplicationController
  before_action :move_to_index

  def show
    @user = current_user if current_user
    @posts = current_user.posts
    @likes = current_user.likes
    @stocks = current_user.stocks
    @answers = current_user.responses
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
