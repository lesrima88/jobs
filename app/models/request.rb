class Request < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged
	is_impressionable

	has_attached_file :image, styles: { medium: "250x", thumb: "50x" }, default_url: "missing2"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	belongs_to :user
	
	
	belongs_to :category
	belongs_to :city
	validates_presence_of :title, :body, :budget ,:contact 
	has_many :favorites, as: :favorited
    has_many :fans, through: :favorites, source: :user
    has_many :comments 



   validates_presence_of :title , :body, :category_id, :city_id
   validates :budget, presence: true , numericality: true
   validates :contact, presence: true , numericality: true, length:{minimum: 8, maximum: 10}


 def completed?
 	!completed_at.blank?
 end








def self.search(search)
	
	if search
		joins(:category).where(["categories.name like ? OR title LIKE ? OR body LIKE ?","%#{search}%", "%#{search}%" , "%#{search}%"])
	else
		

	end

end


end 