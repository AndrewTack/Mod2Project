class CreateInfluencers < ActiveRecord::Migration[5.1]
  def change
    create_table :influencers do |t|
      t.string :name
      t.string :role
      t.integer :age
      t.string :gender
      t.string :social_media
      t.string :sport
      t.string :location
      t.string :image_url 
      
      t.timestamps
    end
  end
end
