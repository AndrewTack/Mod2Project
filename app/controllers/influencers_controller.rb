class InfluencersController < ApplicationController

    def index
        @influencers = Influencer.all
    end

    def show
        @influencer = Influencer.find(params[:id])
    end

    def new
        @influencer = Influencer.new
    end

    def create
        @influencer = Influencer.create(influencer_params)
        if @influencer.valid?
            redirect_to @influencer
        else 
            flash[:errors] = @influencer.errors.full_messages
            redirect_to new_influencer_path
        end 
    end

    def edit
        @influencer = Influencer.find(params[:id])
    end

    def update
        @influencer = Influencer.find(params[:id])
        if @influencer.update(brand_params)
            redirect_to @influencer
        else 
            flash[:errors] = @influencer.errors.full_messages
            redirect_to edit_influencer_path(@influencer)
        end     
    end

    def destroy
        @influencer = Influencer.find(params[:id])
        @influencer.destroy

        redirect_to influencers_path
    end

    private

    def influencer_params
        params.require(:influencer).permit(:name, :role, :age, :gender, :social_media, :sport, :location, :image_url)
    end

end
