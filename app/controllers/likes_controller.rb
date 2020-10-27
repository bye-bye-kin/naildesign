class LikesController < ApplicationController
  before_action :authenticate_user!
  #サイン済のユーザーにのみアクセスを許可
  def create
    @like = current_user.likes.build(like_params)
    @nail = @like.nail
    if @like.save
      respond_to :js
    end
  end

  def destroy
    @like =Like.find_by(id: params[:id])
    @nail= @like.nail
    if @like.destroy
      respond_to :js
    end
  end

  private
  def like_params
    params.permit(:nail_id)
  end
end
