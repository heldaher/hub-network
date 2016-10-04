class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
