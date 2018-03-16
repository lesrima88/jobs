class Review < ActiveRecord::Base
	belongs_to :job
	belongs_to :user



def average_review
  reviews.sum('rating') / reviews.count
end

end


