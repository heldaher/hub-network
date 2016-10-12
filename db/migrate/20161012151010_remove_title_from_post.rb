class RemoveTitleFromPost < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :title, :post
  end
end
