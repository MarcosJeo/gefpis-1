class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(member_t)
  	evaluation_ts_path(@evaluation_t)
  end
  def after_sign_out_path_for(member_t)
  	
  end

  protected
  def authenticate_user!
    if member_t_signed_in?
      super
    else
      redirect_to root_path
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end

end
