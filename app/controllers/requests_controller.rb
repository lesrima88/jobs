class RequestsController < ApplicationController
	before_action :find_request, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new,  :edit]
  def index
  	@requests = Request.all
  end

  def new
  	@request = current_user.requests.build
  	@categories = Category.all.map{  |c|  [c.name, c.id] }
	@cities = City.all.map{  |c|  [c.name, c.id] }
  end

  def create

  	@request = current_user.requests.build(request_params)


		respond_to do |format|
			if @request.save
				format.html { redirect_to request_path, notice: 'Your Request is now live!'}

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
   	 if @requests.update(params.require(:request).permit(:title, :body, :price))
        format.html { redirect_to requests_path, notice: 'Your Request was successfully updated.' }
       
      else
        format.html { render :edit }
        
      end
   end

   def destroy
   	@requests.destroy
   	redirect_to root_path 
   end
end
