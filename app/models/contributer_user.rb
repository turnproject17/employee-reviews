class ContributerUser < ApplicationRecord
	belongs_to :contributer, class_name:"User" , foreign_key:"contributer_id"
	belongs_to :contributed_performance,  class_name:"PerformanceReview", foreign_key: "performance_review_id"
end
