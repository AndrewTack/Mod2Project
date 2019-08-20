class CampaignInfluencer < ApplicationRecord

    belongs_to :campaign
    belongs_to :influencer

    validates :pitch, length: {minimum: 50}

end
