class UsersController < ApplicationController

	def new	
		@user = User.new
	end

	def create
		@user = User.new(allowed_params)
		if @user.save
			session[:user_id] = @user.id #making new session when user signs up. aka signing up & logging in
			redirect_to root_url, :notice => "Thank you for signing up."
		else
			render "new"
		end
	end

	private
	def allowed_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
	
end
