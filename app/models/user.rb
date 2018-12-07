class User < ActiveRecord::Base
  
  has_many :notifications, foreign_key: :recipient_id
	has_many :jobs
  has_many :requests
	has_many :reviews
	has_many :favorites
  has_many :favorite_jobs, through: :favorites, source: :favorited, source_type: 'Job'


    
  
  acts_as_messageable 
  

  if @avatar.blank?
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.jpg"
  has_attached_file :avatar, default_url: "missing.jpg"
   validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  else 
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  end
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
 
         :recoverable, :rememberable, :trackable, :validatable,

         :omniauthable, :omniauth_providers => [:facebook]




        def update_with_password(params, *options)
    current_password = params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = if params[:password].blank? || valid_password?(current_password)
      update_attributes(params, *options)
    else
      self.assign_attributes(params, *options)
      self.valid?
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      false
    end

    clean_up_passwords
    result
end 



def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
    end
  end
end

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.avatar = auth.info.image # assuming the user model has an image # this was user.image i changed it to experiment

  end
end


  

def mailboxer_email(object)

  nil
 end 


         

 
end
