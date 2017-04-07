class UsersController < ApplicationController



 	def index

		

		if params[:category].blank?
			@jobs = Job.all.order("created_at DESC")
			
		else
			@category_id = Category.find_by(name: params[:category]).id
			
			@jobs = Job.where("name LIKE ?","%#{params[:search]}%")
			
		end



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
	params.require(:user).permit(:first_name, :last_name, :user)
end

 end 

