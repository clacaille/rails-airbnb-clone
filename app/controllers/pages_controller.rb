class PagesController < ApplicationController
  def home
    @camps = Camp.all
  end
end
