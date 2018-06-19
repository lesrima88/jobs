class CategoriesController < ApplicationController


	def index
		@category_id = Category.find_by(name: params[:category]).id
		@jobs = Job.where(:category_id => @category_id)
		@requests = Request.where(:category_id => @category_id)
	end


	def show
		@category_id = Category.find_by(name: params[:category]).id
		@jobs = Job.where(:category_id => @category_id)
		@requests = Request.where(:category_id => @category_id)
    end 



end 

