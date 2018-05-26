class Admin::PerformanceReviewsController < Admin::ApplicationController
	before_action :set_employee
  
  def index
  	@reviews = @employee.performance_reviews
  end

  def new
  	@review = @employee.performance_reviews.new
  end

  def show
  	@review = @employee.performance_reviews.find(params[:id])
  	@comments = @review.comments
  end

  def create
    @review = @employee.performance_reviews.new(performance_params.merge!({given_by: current_user.id}))
  	if @review.save
      flash[:success] = "Performance review has added successfully."
      redirect_to admin_employee_performance_review_path(@employee, @review)   
    else
      flash[:error] = "#{@review.errors.full_messages.join(',')}"
      render (:new)
    end
  end

  def comment
  	@review = @employee.performance_reviews.find(params[:id])
		@comment = @review.comments.new(given_by: @employee.id, body: params[:comment][:body])
		if @comment.save
			flash[:success] = "Comment has posted successfully."
			redirect_to admin_employee_performance_review_path(@employee, @review)
		else
			redirect_to admin_employee_performance_review_path(@employee, @review)
		end
  end

  def update
    @review = @employee.performance_reviews.find(params[:id])
    if @review.update(contributer_ids: params[:performance_review][:contributer_ids]) 
      flash[:success] = "Contributers has added successfully."
      redirect_to contributers_admin_employee_performance_review_path(@employee, @review)   
    else
      redirect_to contributers_admin_employee_performance_review_path(@employee, @review)
    end
  end

  def contributers
    @review = @employee.performance_reviews.find(params[:id])
    @contributers = @review.contributers
    @users = User.all - [current_user, @review.user] 
  end


  private
  	def set_employee
  		@employee = User.find(params[:employee_id])
  	end

    def performance_params
      params.require(:performance_review).permit(:body)
    end
end
