class CreateContributerUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :contributer_users do |t|
      t.integer :contributer_id
      t.integer :performance_review_id

      t.timestamps
    end
  end
end
