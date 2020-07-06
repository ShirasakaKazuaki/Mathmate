class PostsController < ApplicationController
  PER = 8
  before_action :move_to_index, except: [:index, :show]

  def index
    @searched_posts = Post.search(params[:search], params[:unit_ids]).order(created_at: :desc).page(params[:page]).per(PER)
    @unit_one = Category.find(1).units
    @unit_two = Category.find(2).units
    @unit_three = Category.find(3).units
    @unit_a = Category.find(4).units
    @unit_b = Category.find(5).units
    @unit_c = Category.find(6).units
    @unit_other = Category.find(7).units
  end

  def new
    @post = Post.new
    @unit_one = Category.find(1).units
    @unit_two = Category.find(2).units
    @unit_three = Category.find(3).units
    @unit_a = Category.find(4).units
    @unit_b = Category.find(5).units
    @unit_c = Category.find(6).units
    @unit_other = Category.find(7).units
  end

  def create
    post = Post.new(
      title: post_params[:title],
      question: post_params[:question],
      qimg: post_params[:qimg],
      answer: post_params[:answer],
      aimg: post_params[:aimg],
      content: post_params[:content],
      supplement: post_params[:supplement],
      user_id: current_user.id
    )

    if post_params[:unit_ids].blank?
      flash.now[:alert] = '不正登録です。'
      render :index
    else
      post_params[:unit_ids].each do |unit_id|
        unit = Unit.find(unit_id)
        post.units << unit
        post.save!
        redirect_to "/posts/#{post.id}"
      end
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @responses = @post.responses.includes(:user)
    @like = Like.new
    @stock = Stock.new
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id == current_user.id
    redirect_to '/'
    flash[:notice] = '🗑投稿を削除しました'
  end

  def edit
    @post = Post.find(params[:id])
    redirect_to "/posts/#{@post.id}" if @post.user_id != current_user.id

    @unit_one = Category.find(1).units
    @unit_two = Category.find(2).units
    @unit_three = Category.find(3).units
    @unit_a = Category.find(4).units
    @unit_b = Category.find(5).units
    @unit_c = Category.find(6).units
    @unit_other = Category.find(7).units
  end

  def update
    post = Post.find(params[:id])

    qimg =  post_params[:qimg].presence || post.qimg

    aimg =  post_params[:aimg].presence || post.aimg

    if post_params[:remove_qimg] == '1'
      post.remove_qimg!
      post.save
    end

    if post_params[:remove_aimg] == '1'
      post.remove_aimg!
      post.save
    end

    post.update(
      title: post_params[:title],
      question: post_params[:question],
      qimg: qimg,
      answer: post_params[:answer],
      aimg: aimg,
      content: post_params[:content],
      supplement: post_params[:supplement],
      user_id: current_user.id
    )
    post.units.destroy_all
    post_params[:unit_ids].each do |unit_id|
      unit = Unit.find(unit_id)
      post.units << unit
    end

    redirect_to "/posts/#{post.id}"
  end

  private

  def post_params
    params.require(:post).permit(:title, :question, :qimg, :answer, :aimg, :content, :supplement, :remove_qimg, :remove_aimg, unit_ids: [])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
