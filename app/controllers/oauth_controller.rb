class OauthController < ApplicationController

  def callback
    begin
        user = User.find_by(email: request.env['omniauth.auth'][:info][:email])
        if user && !user.activated?
            user.activate
        end
        if !user
            @user = User.new
            @user[:email] = request.env['omniauth.auth'][:info][:email]
            @user[:firstName] = request.env['omniauth.auth'][:info][:first_name]
            @user[:lastName] = request.env['omniauth.auth'][:info][:last_name]
            @user.save
            @user.activate
            user = @user
        end
        log_in user
        redirect_to user

    rescue => e
      flash[:alert] = "There was an error while trying to authenticate your account."
      redirect_to register_path
    end
  end

  def failure
    flash[:alert] = "There was an error while trying to authenticate your account."
    redirect_to register_path
  end

end
