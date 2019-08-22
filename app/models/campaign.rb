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

    # def do_you_approve
    #     #need to be able to edit campaign.approval_status
    #     do_we_want_this_influencer = @campaign_influencer.approval_status
    #     if do_we_want_this_influencer
    #         @campaign_influencer.approval_status == true
    #         flash[:notify] = "Great! We'll notify #{@influencer.name} that you'd like to work with them!"
    #     else 
    #         @campaign_influencer.destroy
    #         flash[:notify] =  "No problem! We'll let you know when more influencers express interest in working with you on this campaign!"
    #     end
    # end

end
