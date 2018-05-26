class Comment < ApplicationRecord
	belongs_to :resource, polymorphic: true
	belongs_to :given_by_user, class_name:"User", foreign_key: "given_by"
end
