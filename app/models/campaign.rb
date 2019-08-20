class Campaign < ApplicationRecord

    belongs_to :brand, optional: true 
    has_many :campaign_influencers
    has_many :influencers, through: :campaign_influencers

    validates :title, presence: true 
    validates :summary, length: { minimum:10 }

end
