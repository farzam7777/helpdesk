class RenameTypeToKind < ActiveRecord::Migration[5.1]
  def change
  	rename_column :services, :type, :kind
  end
end
