class BookingsController < ApplicationController
  before_action :set_camps, only: [:new, :create]
  before_action :set_booking, only: [:edit, :update, :show, :destroy]
  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.camp = @camp
    @booking.user = current_user
    if @booking.save
        redirect_to booking_path(@camp)
      else
        render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :surfers)
  end

  def set_camps
    @camp = Camp.find(params[:camp_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
