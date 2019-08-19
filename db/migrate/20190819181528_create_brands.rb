class CreateBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.integer :year_founded
      t.string :description
      
      t.timestamps
    end
  end
end
