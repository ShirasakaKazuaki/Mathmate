class StocksController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @stock = current_user.stocks.create(post_id: params[:post_id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @stock = Stock.find_by(post_id: params[:post_id], user_id: current_user.id)
    @stock.destroy
  end
end
