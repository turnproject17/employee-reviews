class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable     
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :by_admin
  has_many :performance_reviews
  has_many :given_reviews, class_name:"PerformanceReview", foreign_key:"given_by"

  has_many :contributer_users, foreign_key: "contributer_id" 

  has_many :contributed_performances, class_name:"PerformanceReview", through: :contributer_users

  enum role_id: %w{admin}        

  def need_contribution? review
    contributed_performances.include? review
  end

  def full_name
  	if first_name.blank? 
  		"N/A"
  	else
  		"#{first_name} #{last_name}".titleize
  	end
  end

  def identity
  	if first_name.blank? 
  		"#{email}"
  	else
  		"#{first_name} #{last_name}".titleize
  	end
  end

end
