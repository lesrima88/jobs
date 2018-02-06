class UsersController < ApplicationController

	def favorite

		@jobs = current_user.favorite_jobs
	end 
		


		


 	#def destroy

		#Favorite.where(favorited_id: @job.id, user_id: current_user.id).first.destroy
    	#redirect_to @job, notice: 'Service succesfully removed from favorites'
	#
def destroy
	sign_out
    redirect_to root_url
end 




  	def show
  		@user = User.find(params[:id])
  	end 


  	def edit

  		@user = User.find(params[:id])

  	end 

  	def update 
	 	@user = User.find(params[:id])  
	 
			if @user.update(user_params)
				redirect_to @user, :notice => "Succesfully Updated Profile"
			else
			render "Edit"
			end
 
 	end 




	private 



	def user_params
	params.require(:user).permit(:first_name, :last_name, :user, :job_id, :favorite_id, :user_id)
	end

 
 end 

