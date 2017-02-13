class BookingsController < ApplicationController
  before_action :set_camps, only: [:new, :create, :destroy, :update]
  before_action :set_booking, only: [:edit, :update, :show, :destroy]
  def index
    @bookings = Booking.all
  end

  def show
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

  def edit
  end

  def update
    @booking.camp = @camp
    @booking.update(booking_params)
    if @booking.save
      redirect_to
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to camp_path(@camp)
  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :surfer, :camp_id)
  end

  def set_camps
    @camp = Camp.find(params[:camp_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
