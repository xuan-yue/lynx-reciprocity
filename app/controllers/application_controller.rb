class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper



  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user) || current_user.admin?
	  	flash[:danger] = "Sorry. Your account cannot access this page."
	    redirect_to(root_url) 
      end
    end
    
    # Confirms the correct user.
    def admin_user
      unless logged_in? && current_user.admin?
      flash[:danger] = "Sorry. Your account cannot access this page."
      redirect_to(root_url) 
      end
    end
    
end
