class ResponsesController < ApplicationController
  def create
    @response = Response.create(
      content: res_params[:content],
      post_id: res_params[:post_id],
      user_id: current_user.id
    )
    redirect_to "/posts/#{@response.post_id}"
  end

  private

  def res_params
    params.permit(:content, :post_id)
  end
end
