class User < ActiveRecord::Base
	has_many :jobs
	has_many :reviews


		 has_attached_file :job_img, styles: { job_index: "100x100>", job_show: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :job_img, content_type: /\Aimage\/.*\z/	


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
 
         :recoverable, :rememberable, :trackable, :validatable



  


         

 
end
