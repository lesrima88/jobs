class RequestsController < ApplicationController
	before_action :set_request, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new,  :edit]
  def index
  	@requests = Request.all
  end

  def new
  	@request = current_user.requests.build
  	@categories = Category.all.map{  |c|  [c.name, c.id] }
	  @cities = City.all.map{  |c|  [c.name, c.id] }
  end

  def search

  end 

  def create

  	@request = current_user.requests.build(request_params)


		respond_to do |format|
			if @request.save
				format.html { redirect_to @request, notice: 'Your Request is now live!'}

					else 
			 format.html { render :new}

			end
		end

	end

		
		
  def show
	@requests = Request.friendly.find(params[:id])
  end 
  

  def edit 
  	@categories = Category.all.map{  |c|  [c.name, c.id] }
    @cities = City.all.map{  |c|  [c.name, c.id] }
  end 
   
  def update
   	@request.category_id = params[:category_id]
	  @request.city_id = params[:city_id]
		
   	 if @request.update(request_params)
   	 	redirect_to @request, notice: 'Your Request was successfully updated.' 
      else
        render "Edit"
      end 
   end



  def destroy
   	@request.destroy
   	redirect_to root_path , notice: 'Your listing was successfully removed.'
  end

  def complete
    @request = Request.find(params[:id])
    @request.update_attribute(:completed_at, Time.now)
    redirect_to root_path
  end 


  private 

	def request_params
		params.require(:request).permit(:title, :body, :budget, :category_id, :city_id, :search, :contact, :request_id)
	end

	def set_request 
		@request = Request.friendly.find(params[:id]) rescue nil 
	end


end
