class Campaign < ApplicationRecord

    belongs_to :brand, optional: true 
    has_many :campaign_influencers
    has_many :influencers, through: :campaign_influencers

    validates :title, presence: true 
    validates :summary, length: { minimum:10 }

    #don't think this is working?
    def self.seach(search)
        where("name LIKE ?", "%#{search}%")
        where("content LIKE ?", "%#{search}%")
    end

    def do_you_approve
        #this was what we did for CLI app. No need to prompt on a website! Imbed this in the HTML
        we_want_this_influencer = @prompt.yes?("Would you like to work with this influencer?")
        if we_want_this_influencer
            @campaign_influencer.approval_status == true
            puts "Great! We'll notify #{@influencer.name} that you'd like to work with them!"
        else 
            @campaign_influencer.destroy
            puts "No problem! We'll let you know when more influencers express interest in working with you on this campaign!"
        end
    end

end
