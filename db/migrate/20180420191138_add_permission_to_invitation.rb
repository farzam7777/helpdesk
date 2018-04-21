class AddPermissionToInvitation < ActiveRecord::Migration[5.1]
  def change
    add_column :invitations, :permission, :string
  end
end
