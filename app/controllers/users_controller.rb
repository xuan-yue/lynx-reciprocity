class UsersController < ApplicationController
  respond_to :html, :json
  before_action :logged_in_user, only: [:edit, :update, :show]
  before_action :correct_user,   only: [:edit, :update, :show]
  #before_action :admin_user,     only: [:index, :destroy]

  def index
  @users = User.paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
     # flash[:danger] = "Sorry, the account could not be created."
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      flash[:danger] = "Sorry, the update could not be saved."
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:firstName, :lastName, :email, :phone, 
                                  :street1, :street2, :city, 
                                  :state, :zip, :admin, :password, 
                                  :password_confirmation, :picture, :terms_of_service)
    end
    # Before filters


end