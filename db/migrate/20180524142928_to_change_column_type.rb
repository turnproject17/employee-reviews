class ToChangeColumnType < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :joining_date, :datetime 
  end
end
