class UsersController < ApplicationController
	before_action :require_user, only: [:show]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		
		if @user.save
			session[:user_id] = @user.id
			redirect_to '/'
		else
			redirect_to '/signup'
		end
	end

	def show
    @user_plant_locations = PlantLocation.where(username: current_user.username)
  end

	private
	
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
end
