class LikesController < ApplicationController
  before_action :authenticate_user!
  #サイン済のユーザーにのみアクセスを許可
  def create
    @like = current_user.likes.buld(like_params)
    @nail = @like.post
    if @like.save
      respond_to :js
    end
  end

  def detroy
    @like =Like.find_by(id:params[:id])
    @post = @like.post
    if @like.destroy
      respond_to :js
    end
  end

  private
  def like_params
    params.permit(:nail_id)
  end
end
