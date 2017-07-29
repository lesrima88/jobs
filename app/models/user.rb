class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged
	has_many :jobs
  has_many :requests
	has_many :reviews
	has_many :favorites
    has_many :favorite_jobs, through: :favorites, source: :favorited, source_type: 'Job'
    has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'

has_many :personal_messages, dependent: :destroy


		  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
 
         :recoverable, :rememberable, :trackable, :validatable


def admin?
   self.roles.include?(:admin)
end
  


         

 
end
