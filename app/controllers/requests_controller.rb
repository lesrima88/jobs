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
     @requests = Request.search(params)
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
	@requests = Request.find(params[:id])
  end 
  

  def edit 
  	@requests = Request.find(params[:id])

  end 
   
   def update
   	@requests = Request.find(params[:id])
   	 if @requests.update(params.require(:request).permit(:title, :body, :contact,:budget))
        format.html { redirect_to requests_path, notice: 'Your Request was successfully updated.' }
       
      else
        format.html { render :edit }
        
      end
   end

   def destroy
   	@requests.destroy
   	redirect_to root_path 
   end

     private 

	def request_params
		params.require(:request).permit(:title, :body, :budget, :category_id, :city_id, :search, :contact, :request_id)
	end

	def set_request 
		@request = Request.find(params[:id])
	end
end
