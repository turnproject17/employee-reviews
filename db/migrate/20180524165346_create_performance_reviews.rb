class CreatePerformanceReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :performance_reviews do |t|
      t.integer :user_id
      t.integer :given_by
      t.text :body

      t.timestamps
    end
  end
end
