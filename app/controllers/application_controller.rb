class ApplicationController < ActionController::Base
  protect_from_forgery

  # load_and_authorize_resource

  # check_authorization

  rescue_from CanCan::AccessDenied do |exception|
    # raise exception
    # render json: [exception, exception.backtrace]
    redirect_to root_url, :alert => exception.message
  end

end
