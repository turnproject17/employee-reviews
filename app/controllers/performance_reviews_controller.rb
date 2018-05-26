class PerformanceReviewsController < ApplicationController
  before_action :set_review, only: [:show, :comment]  

  def index
  	@reviews = current_user.performance_reviews + current_user.contributed_performances
  end

  def show
  	@comments = @review.comments
  end

  def comment
		@comment = @review.comments.new(given_by: current_user.id, body: params[:comment][:body])
		if @comment.save
			flash[:success] = "Comment has posted successfully."
			redirect_to performance_review_path(@review)
		else
			redirect_to performance_review_path(@review)
		end
  end

  private
    def set_review
      @review = current_user.performance_reviews.find(params[:id]) rescue current_user.contributed_performances.find(params[:id])
    end
end
