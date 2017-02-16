class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :filter ]
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

  def filter
    radius = 1000
    radius = params[:radius_km] unless params[:radius_km].blank?
    @camps = Camp.near(params[:search], radius)
    #binding.pry
    @hash = Gmaps4rails.build_markers(@camps) do |camp, marker|
      marker.lat camp.latitude
      marker.lng camp.longitude
    end
  end

  private

  def set_camp
    @camp = Camp.find(params[:id])
  end



end
