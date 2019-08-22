class CampaignInfluencersController < ApplicationController

    def index
        @campaign_influencers = CampaignInfluencer.all
    end

    def show
        @campaign_influencer = CampaignInfluencer.find(params[:id])
    end

    def new
        # byebug
        @campaign_influencer = CampaignInfluencer.new
        @current_campaign = params[:campaign_id]
    end

    def create
        @campaign_influencer = CampaignInfluencer.create(campaign_id: params[:campaign_id].to_i, influencer_id: session[:influencer_id], approval_status: false, pitch: params[:campaign_influencer][:pitch])
        if @campaign_influencer.valid?
            redirect_to @campaign_influencer
        else 
            flash[:errors] = @campaign_influencer.errors.full_messages
            redirect_to new_campaign_influencer_path
        end 
    end

    def edit
        @campaign_influencer = CampaignInfluencer.find(params[:id])
    end

    def update
        @campaign_influencer = CampaignInfluencer.find(params[:id])
        if @campaign_influencer.update(campaign_influencer_params)
            redirect_to @campaign_influencer
        else 
            flash[:errors] = @campaign_influencer.errors.full_messages
            redirect_to edit_campaign_influencer_path(@campaign_influencer)
        end     
    end

    def destroy
        @campaign_influencer = CampaignInfluencer.find(params[:id])
        @campaign_influencer.destroy

        redirect_to campaign_influencers_path
    end

    def update_approval_status
    end

    private

    def campaign_influencer_params
        params.require(:campaign_influencer).permit(:campaign_id, :influencer_id, :approval_status, :pitch)
    end

end
