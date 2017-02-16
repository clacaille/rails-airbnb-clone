class ApplicationController < ActionController::Base
  layout "account_layout"
  protect_from_forgery with: :exception
  before_action :authenticate_user!
end
