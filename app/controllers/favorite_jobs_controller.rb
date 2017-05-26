class FavoriteJobsController < ApplicationController
 

  before_action :set_job
	
  

 def index
   @jobs = current_user.favorite_jobs
  end

  def create
    if Favorite.create(favorited: @job, user: current_user)
     flash[:notice] = 'Service succesfully added to favorites'
      redirect_to @job
    else
      redirect_to @job, alert: 'Something went wrong...'
    end
  end

 
  
  def destroy
    Favorite.where(favorited_id: @job.id, user_id: current_user.id).first.destroy
    redirect_to @job, notice: 'Service succesfully removed from favorites'
  end

 
   
   private
  
  def set_job
    @job = Job.find(params[:user_id] || params[:id] )

  end

 end