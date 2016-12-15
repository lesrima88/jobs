class Job < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	belongs_to :city
	has_many :reviews

	 has_attached_file :job_img, styles: { job_index: "300x300>", job_show: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :job_img, content_type: /\Aimage\/.*\z/	

def self.search(params)

jobs = Job.where(category_id: params[:category].to_i)
jobs = Job.where("name like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
jobs = Job.where(params[:city_id]) if params[:city_id].present?
end

end

