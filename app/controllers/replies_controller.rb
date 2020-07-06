class RepliesController < ApplicationController
  def create
    @response = Response.find(rep_params[:response_id])
    @reply = Reply.create(
      content: rep_params[:content],
      response_id: rep_params[:response_id],
      user_id: current_user.id
    )
    redirect_to "/posts/#{@response.post_id}"
  end

  private

  def rep_params
    params.permit(:content, :response_id)
  end
end
