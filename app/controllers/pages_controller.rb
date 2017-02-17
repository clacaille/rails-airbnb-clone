class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :filter ]
  before_action :set_camp, only: [ :camp, :confirm_booking ]
  layout "home_layout"
  def home
    @camps = Camp.last(6)
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
    radius = !params[:radius_km].blank? ? params[:radius_km] : 2000
    result = Geocoder.search(params[:search]).first
    case result.data["types"].first
    when "country" != 'Australia'
      @camps = Camp.near(params[:search], 500)
    when "continent"
      @camps = Camp.near(params[:search], radius)
    when "locality"
      @camps = Camp.near(params[:search], 20)
    else
      @camps = Camp.near(params[:search], radius)
    end
    @hash = Gmaps4rails.build_markers(@camps) do |camp, marker|
      marker.lat camp.latitude
      marker.lng camp.longitude
      marker.picture({
        :url => ActionController::Base.helpers.asset_path('marker.png'),
        :width   => 18.42,
        :height  => 70,
       })
    end
  end

  # def gmaps4rails_marker_picture
  #   {
  #   "picture" => '/asset/marker.png',          # string,  mandatory
  #    "width" =>  50,          # integer, mandatory
  #    "height" => 100,          # integer, mandatory
  #  }
  # end


 private

  def set_camp
    @camp = Camp.find(params[:id])
  end



end
