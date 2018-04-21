class CreateCategoryUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :category_users do |t|
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true
      t.string :permission

      t.timestamps
    end
  end
end
