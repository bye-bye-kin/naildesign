class NailsController < ApplicationController
  def index
    @nails = Nail.all.order(id: "DESC")
  end

  def show
    @nail = Nail.find(params[:id])
  end

  def new
    @nail = Nail.new
  end

  def create
    @nail = Nail.new(nail_params)
    @nail.user_id = current_user.id
    @nail.save
    # redirect_to nail_path(@nail)
    redirect_to user_path(@nail.user_id)
    
  end

  def edit
    @nail = Nail.find(params[:id])
  end

  private
  def nail_params
    params.require(:nail).permit(:title, :body, :image)
  end

end
