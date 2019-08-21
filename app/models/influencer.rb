class Influencer < ApplicationRecord

    has_many :campaign_influencers
    has_many :campaigns, through: :campaign_influencers

    validates :name, presence: true
    validates :age, numericality: {greater_than_or_equal_to: 18}
    validates :age, numericality: {less_than_or_equal_to: 100}

    has_secure_password

end