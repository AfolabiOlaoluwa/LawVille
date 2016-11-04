class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def page_not_found
    respond_to do |format|
      format.html { render 'shared/_not_found_error', layout: 'application', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
  end

  def server_error
    respond_to do |format|
      format.html { render 'shared/_internal_server_error', layout: 'application', status: 500 }
      format.all  { render nothing: true, status: 500}
    end
  end


end

=begin
  # custom 404
  unless Rails.application.config.consider_all_requests_local
    rescue_from ActiveRecord::RecordNotFound,
                ActionController::RoutingError,
                ActionController::UnknownController,
                ActionController::ActionNotFound,
                ActionController::MethodNotAllowed do |exception|

      # Put loggers here, if desired.

      #redirect_to four_oh_four_path
    end
  end
=end
