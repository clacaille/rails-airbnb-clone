class ReviewsController < ApplicationController
before_action :set_camp, only: [:index, :new]
before_action :set_review, only: [ :edit, :update ]


  def index
    @reviews = @camp.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.camp = Camp.find(params[:camp_id])
    @camp = @review.camp
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
      redirect_to user_path(@review.user)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to :back
  end


  private

  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end

  def set_camp
    @camp = Camp.find(params[:camp_id])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_review
     @review = Review.find(params[:id])
  end

end
