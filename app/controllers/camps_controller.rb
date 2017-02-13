class CampsController < ApplicationController
before_action :set_camp, only: [:show, :edit, :update, :destroy]
  def index
    @camps = Camp.all
  end

  def show
  end

  def new
    @camp = Camp.new
  end

  def create
    @camp = Camp.new(camp_params)
    @camp.user = current_user
    if @camp.save
      redirect_to camp_path(@camp)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @camp.update(camp_params)
    if @camp.save
      redirect_to camp_path(@camp)
    else
      render :new
    end
  end

  def destroy
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def camp_params
    params.require(:camp).permit(:title, :description, :address, :price)
  end

  def set_camp
    @camp = Camp.find(params[:id])
  end

end
