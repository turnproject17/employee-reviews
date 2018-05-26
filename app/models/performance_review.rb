class PerformanceReview < ApplicationRecord
	belongs_to :user
	belongs_to :given_by_user, class_name:"User", foreign_key:"given_by"
	has_many :comments, as: :resource
	
	has_many :contributer_users	
	has_many :contributers, class_name: "User", through: :contributer_users	

end
