class UsersController < ApplicationController

	skip_before_filter :verify_authenticity_token

	def show
		@user = User.find(session[:user_id])
	end

	def login
		@user = User.new
	end

	def new    #signup form
		@user = User.new
	end

	def create
    if @user = User.create(user_params)
	    session[:user_id] = @user.id
	    redirect_to root_path
	  else
	  	redirect_to signup_path
	  end
	end


  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end

end
