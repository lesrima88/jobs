class JobsController < ApplicationController
	before_action :set_job, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new,  :edit]
	before_action :has_job, only: [:new]
	
	
	def index
			@jobs = Job.all.order("created_at DESC")
			@requests = Request.all.order("created_at DESC")
			#@jobs = Job.search(params[:search])



		end

	def all
		@jobs = Job.all

	end
    

    def contact
    end
	

	def show
     	@jobs = Job.friendly.find(params[:id])

		if @job.reviews.blank?
			@average_review = 0
		else
			@average_review = @job.reviews.average(:rating).round(2)
		

		end
    
	end

	def search
    	@jobs = Job.search(params[:search])
		@requests = Request.search(params[:search])


    end


	

	def new
		

		@job = current_user.jobs.build
		@categories = Category.all.map{  |c|  [c.name, c.id] }
		@cities = City.all.map{  |c|  [c.name, c.id] }
		@prices = Price.all.map{  |c|  [c.name, c.id] }



	end

	def create
        @job = current_user.jobs.build(jobs_params)
        if @job.save
			redirect_to @job, notice: 'Your listing was successfully updated.'
		else
			render :new
		end
	end


	def edit
		@categories = Category.all.map{  |c|  [c.name, c.id] }
		@cities = City.all.map{  |c|  [c.name, c.id] }
		@prices = Price.all.map{  |c|  [c.name, c.id] }
	end



	def update
		@job.category_id = params[:category_id]
		@job.city_id = params[:city_id]
		@job.price_id = params[:price_id]
		if @job.update(jobs_params)
			redirect_to @job, notice: 'Your listing was successfully updated.'
		else
			render "Edit"
		end
	end


	def destroy
		@job.destroy

		redirect_to root_path, notice: 'Your listing was successfully removed.'
	end




	def favdestroy

	Favorite.where(favorited_id: @job.id, user_id: current_user.id).first.destroy
    redirect_to @job, notice: 'Service succesfully removed from favorites'
	end

	
   private 

   def has_job
  redirect_to root_path, alert: "You can only post one service at a time" if current_user.jobs.exists?
   end

	def jobs_params
		params.require(:job).permit(:title, :description, :company, :url, :category_id, :city_id, :price_id, :image, :search, :phone, :job_id, :favorite_id)
	end

	def set_job 
		@job = Job.friendly.find(params[:id]) rescue nil
	end
end