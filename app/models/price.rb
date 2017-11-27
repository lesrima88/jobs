class Price < ActiveRecord::Base
	has_many :jobs 
	has_many :requests
end
