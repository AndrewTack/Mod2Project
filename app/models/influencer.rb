class Influencer < ApplicationRecord

    has_many :campaign_influencers
    has_many :campaigns, through: :campaign_influencers

    validates :name, presence: true
    validates :age, numericality: {greater_than_or_equal_to: 18}
    validates :age, numericality: {less_than_or_equal_to: 100}


    has_secure_password

    def self.search(search)
        if search 
            influencers = Influencer.all
            influencers = influencers.where(role: params[:role]) 
            influencers = influencers.where(age: params[:age]) 
            influencers = influencers.where(gender: params[:gender]) 
            influencers = influencers.where(sport: params[:sport]) 
            return influencers 
        else
            Influencer.all
        end 
    end 

    

end