class AddCategoryIdToInvitation < ActiveRecord::Migration[5.1]
  def change
    add_column :invitations, :category_id, :integer
  end
end
