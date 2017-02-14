class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  layout "home_layout"
  def home
    @camps = Camp.all
  end
end
