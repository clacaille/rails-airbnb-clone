class BookingsController < ApplicationController
  before_action :set_camps, only: [:new, :create, ]
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.camp = @camp
    if @booking.save
        redirect_to camp_path(@camp)
      else
        render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to
  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :surfer, :camp_id)
  end

  def set_camps
    @camp = Camp.find(params[:camp_id])
  end

end
