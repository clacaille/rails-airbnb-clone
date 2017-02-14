class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  layout "home_layout"
  def home
    @camps = Camp.all
  end

  def camp
    @camp = Camp.find(params[:id])
    @booking = Booking.new
  end

  def my_camps
    @camps = Camp.where(user: current_user)
  end

end
