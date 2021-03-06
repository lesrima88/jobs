 class Job < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged
	is_impressionable

	#include ImageUploader[:image]
	include ImageUploader::Attachment.new(:image) # adds an `image` virtual attribute
	

   #if   @image.blank?
   #has_attached_file :image, default_url: "missing.jpg"
   #end
     
	
	#has_attached_file :image, styles: { medium: "300x300", thumb: "100x100" }, default_url: "spanner"
	#validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/



	friendly_id :company, use: :slugged
	belongs_to :user
	belongs_to :price 
	belongs_to :category
	belongs_to :city
	has_many :reviews
	has_many :favorites, as: :favorited
    has_many :fans, through: :favorites, source: :user
    has_many :comments 
    has_many :images
   


	
  
	   
validates_presence_of :title , :description, :price, :phone, :category_id, :city_id

 def average_review
  if reviews.blank?
    @average_review = 0
  else
    @average_review = reviews.average(:rating).round(2)
  end
end






def self.search(search)
	
	if search
		joins(:category).where(["categories.name like ? OR title LIKE ? OR description LIKE ?","%#{search}%", "%#{search}%" , "%#{search}%"])
	else
		

	end

end



#def self.search(search)
  #joins(:category).where(
   # ["categories.name like ? OR title LIKE ? OR description LIKE ?",
    # search, search, search]
 # )
#end





end

