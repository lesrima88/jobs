class Job < ActiveRecord::Base
	extend FriendlyId
	friendly_id :company, use: :slugged
	belongs_to :user
	belongs_to :price 
	belongs_to :category
	belongs_to :city
	has_many :reviews
	has_many :favorites, as: :favorited
    has_many :fans, through: :favorites, source: :user
    has_many :comments 

	 has_attached_file :job_img, styles: { job_index: "100x100>", job_show: "300x300>" }, default_url: "/images/style/missing.jpg"
  validates_attachment_content_type :job_img, content_type: /\Aimage\/.*\z/	




def self.search(params)

jobs = Job.where(category_id: params[:category].to_i)

jobs = Job.where(city_id: params[:city].to_i)
jobs
end

end

