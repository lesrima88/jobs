class JobsController < ApplicationController
	before_action :find_job, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new,  :edit]

	def index

		if params[:category].blank?
			@jobs = Job.all.order("created_at DESC")
			
		else
			@category_id = Category.find_by(name: params[:category]).id
			
			@jobs = Job.where("name LIKE ?","%#{params[:search]}%")
			
		end
	end

	def search
		 @jobs = Job.search(params)


	end

	def show


		if @job.reviews.blank?
			@average_review = 0
		else
			@average_review = @job.reviews.average(:rating).round(2)
		end


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
			redirect_to @job
		else
			render "New"
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
			redirect_to @job
		else
			render "Edit"
		end
	end

	def destroy
		@job.destroy
		redirect_to root_path
	end

	private

	def jobs_params
		params.require(:job).permit(:title, :description, :company, :url, :category_id, :city_id, :price_id,:job_img, :search, :phone)
	end

	def find_job 
		@job = Job.find(params[:id])
	end
end
