class Influencer < ApplicationRecord

    has_many :campaign_influencers
    has_many :campaigns, through: :campaign_influencers

    validates :name, presence: true
    validates :age, numericality: {minimum: 18}
    validates :age, numericality: {maximum: 100}

end