class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def not_found
    if env["REQUEST_PATH"] =~ /^\/api/
      render :json => {:error => 'not-found'}.to_json, :status => 404
    else
      render 'shared/_not_found_error', layout: 'application', status: 404
    end
  end

  def exception
    if env["REQUEST_PATH"] =~ /^\/api/
      render :json => {:error => 'internal-server-error'}.to_json, :status => 500
    else
      render 'shared/_internal_server_error', layout: 'application', status: 500
    end
  end


end

=begin

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

=end
