class ToAddEmployeesFieldsUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :address, :string
  	add_column :users, :zipcode, :string
  	add_column :users, :joining_date, :datetime
  	add_column :users, :designation, :string
  	add_column :users, :about, :text
  end
end
