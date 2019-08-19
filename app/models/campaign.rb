class Campaign < ApplicationRecord

    belongs_to :brand

    has_many :campaign_influencers
    has_many :influencers, through: :campaign_influencers

end
