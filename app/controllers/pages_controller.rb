class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_camp, only: [ :camp, :confirm_booking ]
  layout "home_layout"
  def home
    @camps = Camp.all
  end

  def camp
    @booking = Booking.new
  end

  def my_camps
    @camps = Camp.where(user: current_user)
  end

  def confirm_booking
    booking = Booking.find(params[:booking][:id])
    booking.accepted = params[:booking][:accepted]
    booking.save
    render :camp
  end

  private

  def set_camp
    @camp = Camp.find(params[:id])
  end
end
