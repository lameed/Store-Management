class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
 

  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to main_app.root_path, :alert => exception.message
  # end
  
  private

  def current_request
  	Request.find(session[:request_id])
  rescue ActiveRecord::RecordNotFound
  	request = Request.create
  	session[:request_id] = request.id
  	request
  end

  def current_part_request
    PartRequest.find(session[:part_request_id])
  rescue ActiveRecord::RecordNotFound
    part_request = PartRequest.create
    session[:part_request_id] = part_request.id
    part_request
  end

end
