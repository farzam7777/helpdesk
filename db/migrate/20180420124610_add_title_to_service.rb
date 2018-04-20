class AddTitleToService < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :title, :string
  end
end
