class UsersController < ApplicationController



 	
 
  
def favorite

	@jobs = current_user.favorite_jobs
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
	params.require(:user).permit(:first_name, :last_name, :user, :job_id, :favorite_id)
end

 end 

