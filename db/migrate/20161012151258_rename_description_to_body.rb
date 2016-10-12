class RenameDescriptionToBody < ActiveRecord::Migration[5.0]
  def change
  	rename_column :posts, :description, :body
  end
end
