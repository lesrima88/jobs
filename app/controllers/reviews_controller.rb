class ReviewsController < ApplicationController
before_action :find_job
before_action :find_review, only: [:edit, :update, :destroy]
before_action :authenticate_user!, only: [:new,  :edit]
before_action :has_reviewed, only: [:new]

def new
	@review = Review.new
end

def create
	@review = Review.new(review_params)
	@review.job_id = @job.id
	@review.user_id = current_user.id

	if @review.save
		redirect_to job_path(@job)

	else
		render 'new'

	end
end

def edit
	
end

def update
	@review = Review.find(params[:id])

	if @review.update(review_params)
		redirect_to job_path(@job)

	else
		render 'edit'
	end
end

def destroy
	@review.destroy
	redirect_to job_path(@job)

end

private


def has_reviewed
  redirect_to job_path(@job), notice: "You've already written a review for this job!" if current_user.reviews.exists?(job: @job)
end

def review_params
	params.require(:review).permit(:rating, :comment)
	end


def find_job
	@job = Job.find(params[:job_id])
end

def find_review
	@review = Review.find(params[:id])

end

end 
