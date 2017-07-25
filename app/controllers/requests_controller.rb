class RequestsController < ApplicationController
	before_action :find_request, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new,  :edit]
  def index
  	@requests = Request.all
  end




  def create

		@request = current_user.requests.build(requests_params)

		if @request.save
			redirect_to @request
		else
			render "New"
		end

  def show
  end
end
