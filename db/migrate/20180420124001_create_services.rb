class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :type
      t.text :description
      t.integer :pdf_needed

      t.timestamps
    end
  end
end
