class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  class AccessDenied < StandardError; end
  rescue_from AccessDenied, with: :over_capacity

private

  def over_capacity
    render file: "/public/over_capacity.html", status: 404
  end

end
