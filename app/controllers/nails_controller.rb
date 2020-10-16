class NailsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
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
    if @nail.save
    # redirect_to nail_path(@nail)
      redirect_to user_path(@nail.user_id)
    else
      render :new
    end
  end

  def edit
    @nail = Nail.find(params[:id])
    if @nail.user != current_user
      redirect_to nails_path, alert: "不正なアクセスです"
    end
  end

  def update
    @nail = Nail.find(params[:id])
    if @nail.update(nail_params)
      redirect_to nail_path(@nail)
    else
      render :edit
    end
  end

  def destroy
    nail = Nail.find(params[:id])
    nail.destroy
    redirect_to nails_path
  end

  private
  def nail_params
    params.require(:nail).permit(:title, :body, :image)
  end

end
