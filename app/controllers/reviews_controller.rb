class ReviewsController < ApplicationController
before_action :set_camp, only: [:index, :new, :create]
before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @reviews = @camp.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.camp = @camp
    @review.user = current_user
    if @review.save
        redirect_to camp_path(@camp)
      else
        render 'camps/show'
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    if @review.save
      redirect_to reviews_path
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_path
  end


  private

  def review_params
    params.require(:review).permit(:title, :description, :rating, :camp_id)
  end

  def set_camp
    @camp = Camp.find(params[:camp_id])
  end

  def set_user
    @user = User.find(params[:id])
  end


end
