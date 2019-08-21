class CampaignsController < ApplicationController
    def index
  
     # if we have query params, make an array for the options of the second dropdown
        @campaigns = Campaign.all

    end

    def show
        @campaign = Campaign.find(params[:id])
    end

    def new
        @campaign = Campaign.new
    end

    def create
        @campaign = Campaign.create(campaign_params)
        if @campaign.valid?
            redirect_to @campaign
        else 
            flash[:errors] = @campaign.errors.full_messages
            redirect_to new_campaign_path
        end 
    end

    def edit
        @campaign = Campaign.find(params[:id])
    end

    def update
        @campaign = Campaign.find(params[:id])
        if @campaign.update(campaign_params)
            redirect_to @campaign
        else 
            flash[:errors] = @campaign.errors.full_messages
            redirect_to edit_campaign_path(@campaign)
        end     
    end

    def destroy
        @campaign = Campaign.find(params[:id])
        @campaign.destroy

        redirect_to campaigns_path
    end

    private

    def campaign_params
        params.require(:campaign).permit(:title, :brand_id, :budget, :summary, :category, :type_of, :image_url, :status)
    end

end


