class User < ActiveRecord::Base
  

	has_many :jobs
  has_many :requests
	has_many :reviews
	has_many :favorites
  has_many :favorite_jobs, through: :favorites, source: :favorited, source_type: 'Job'
    
  
  acts_as_messageable 
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
 
         :recoverable, :rememberable, :trackable, :validatable


def admin?
   self.roles.include?(:admin)
end
  

def mailboxer_email(object)

  nil
 end 
         

 
end
