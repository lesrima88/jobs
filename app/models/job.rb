class Job < ActiveRecord::Base
	belongs_to :category

	 has_attached_file :job_img, styles: { job_index: "300x300>", job_show: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :job_img, content_type: /\Aimage\/.*\z/	



end

