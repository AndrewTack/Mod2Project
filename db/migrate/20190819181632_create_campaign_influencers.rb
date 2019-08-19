class CreateCampaignInfluencers < ActiveRecord::Migration[5.1]
  def change
    create_table :campaign_influencers do |t|
      t.integer :campaign_id
      t.integer :influencer_id
      t.boolean :approval_status, null: false
      t.string :pitch 

      t.timestamps
    end
  end
end
