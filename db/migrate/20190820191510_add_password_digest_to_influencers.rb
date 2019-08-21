class AddPasswordDigestToInfluencers < ActiveRecord::Migration[5.1]
  def change
    add_column :influencers, :password_digest, :string
  end
end
