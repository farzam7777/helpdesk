class AddCategoryIdToService < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :category_id, :integer
  end
end
