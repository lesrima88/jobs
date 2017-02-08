class User < ActiveRecord::Base
	has_many :jobs
	has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
def mailboxer_email(object)
 #return the model's email here
end


  acts_as_messageable


         

 
end
