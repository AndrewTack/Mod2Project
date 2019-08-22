class Influencer < ApplicationRecord

    has_many :campaign_influencers
    has_many :campaigns, through: :campaign_influencers

    validates :name, presence: true
    validates :age, numericality: {greater_than_or_equal_to: 18}
    validates :age, numericality: {less_than_or_equal_to: 100}

    has_one_attached :image_url 
    has_secure_password

    def self.search(search)
        if  search 
            influencers = Influencer.all
            influencers = influencers.where(role: search[:":role"]) 
            # influencers_age_match = influencers_role_match.where(age: search[:":age"])
            influencers = influencers.where(gender: search[:":gender"]) 
            influencers = influencers.where(sport: search[:":sport"])
            # byebug
            return influencers 
        else 
            Influencer.all
        end 
    end 

end