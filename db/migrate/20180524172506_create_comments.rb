class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :given_by
      t.string :resource_type
      t.integer :resource_id
      t.text :body
      t.integer :parent_id

      t.timestamps
    end
  end
end
