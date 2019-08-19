class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.integer :brand_id
      t.integer :budget
      t.string :summary
      t.string :category
      t.string :type
      t.string :image_url
      t.string :status 

      t.timestamps
    end
  end
end
