class ChangeSocialMediaToBeIntegerInInfluencers < ActiveRecord::Migration[5.1]
  def change
    change_column :influencers, :social_media, :integer
  end
end