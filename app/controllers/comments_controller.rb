class CommentsController < ApplicationController

	def new
		@comment = Comment.new
	end 
	def create
		@request = request.find(params[:job_id])
		@comment = @job.comments.create(params[:comment].permit(:name, :body))
		redirect_to job_path(@job)
	end


	def edit 
end

end 
