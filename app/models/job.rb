class Job < ActiveRecord::Base
	extend FriendlyId

	has_attached_file :image, styles: { medium: "300x", thumb: "50x" }, default_url: "missing"
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
   

	
  




def self.search(search)
	if search
		where(["title LIKE ?", "%#{search}%"])
	else
		all

	end


#def self.search(search)
	#if search
		#where(["title LIKE ?","%#{search}%"])
	#else
		#all

	#end


	#def self.search search
  #joins(:request).where("title LIKE ? OR job.title LIKE ?", "%{search}%", "%#{search}%")


end



end

