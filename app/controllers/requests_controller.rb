class RequestsController < ApplicationController
	before_action :find_request, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new,  :edit]
  def index
  	@requests = Request.all
  end

  def new
  	@requests = Request.new
  end


  def show
	@requests = Request.find(params[:id])
  end 

 
end
