class Influencer < ApplicationRecord

    has_many :campaign_influencers
    has_many :campaigns, through: :campaign_influencers

    validates :name, presence: true
    validates :age, numericality: {minimum: 18}
    validates :age, numericality: {maximum: 100}

    has_secure_password

    def self.search(search)
        if search 
            influencer = Influencer.find_by(params[:role])
            influencer = Influencer.find_by(params[:age])
            influencer = Influencer.find_by(params[:gender])
            influencer = Influencer.find_by(params[:sport])
        else
            Influencer.all
        end 
    end 

end