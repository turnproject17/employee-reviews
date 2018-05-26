class Admin::EmployeesController < Admin::ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :delete]

  def index
  	if params[:q] && params[:q][:search].present?
  		@employees = User.all.select{|w| w.full_name.downcase.include?(params[:q][:search].downcase) || w.email.downcase.include?(params[:q][:search].downcase)} - [current_user]
  	else
  		@employees = User.all - [current_user]
  	end
  end

  def show
  end


  def edit
  end

  def update
  	if @employee.update(user_params)
  		flash[:success] = "Employee has updated."
  		redirect_to admin_employee_path(@employee)
  	else
  		flash[:error] = "#{@employee.errors.full_messages.join(',')}"
  		render(:edit)
  	end
  end

  def new
  	@employee = User.new
  end

  def create
  	@employee = User.new(user_params)
  	if @employee.save
  		flash[:success] = "Employee has created."
  		redirect_to admin_employee_path(@employee)
  	else
  		flash[:error] = "#{@employee.errors.full_messages.join(',')}"
  		render(:new)
  	end
  end

  def destroy
  	if @employee.destroy
  		flash[:success] = "Employee has successfully deleted."
  		redirect_to admin_employees_path
  	else
  		flash[:success] = "#{@employee.errors.full_messages.join(',')}"
  		redirect_to admin_employees_path
  	end
  end

  private
  	def set_employee
  		@employee = User.find(params[:id])
  	end

  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :address, :zipcode, :joining_date, :designation, :about, :email, :by_admin, :password)
  	end
end
