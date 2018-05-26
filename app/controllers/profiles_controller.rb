class ProfilesController < ApplicationController

  def show

  end

  def edit
  end

  def update
  	if current_user.update(user_params)
  		flash[:success] = "User profile has updated."
  		redirect_to "/profile"
  	else
  		flash[:error] = "#{current_user.errors.full_messages.join(',')}"
  		render(:edit)
  	end
  end

  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :address, :zipcode, :joining_date, :designation, :about)
  	end
end
