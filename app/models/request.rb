class Request < ActiveRecord::Base
	belongs_to :user
	belongs_to :price 
	belongs_to :category
	belongs_to :city
	validates_presence_of :title, :body, :price
	has_many :favorites, as: :favorited
    has_many :fans, through: :favorites, source: :user
    has_many :comments 



def self.search(params)
 
 requests = Request.where(category_id: params)
 requests = Request.where(city_id[:city].t_i)


end
end 