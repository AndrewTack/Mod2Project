class Influencer < ApplicationRecord

    has_many :campaign_influencers
    has_many :campaigns, through: :campaign_influencers

    #validations...

end