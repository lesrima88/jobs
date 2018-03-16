class Job < ActiveRecord::Base
	extend FriendlyId
	is_impressionable

	has_attached_file :image, styles: { medium: "300x300", thumb: "100x100" }, default_url: "missing"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/



	friendly_id :company, use: :slugged
	belongs_to :user
	belongs_to :price 
	belongs_to :category
	belongs_to :city
	has_many :reviews
	has_many :favorites, as: :favorited
    has_many :fans, through: :favorites, source: :user
    has_many :comments 
   

	
  
	   
	validates_presence_of :title , :description, :price_id, :phone, :category_id, :city_id

 def average_review
  if reviews.blank?
    @average_review = 0
  else
    @average_review = reviews.average(:rating).round(2)
  end
end






def self.search(search)
	if search
		where(["title LIKE ? OR description LIKE ?", "%{search}%" , "%{search}%"])
	else
		all

	end




end





end

