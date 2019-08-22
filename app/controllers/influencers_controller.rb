class InfluencersController < ApplicationController
    skip_before_action :authorized, only: [:index, :new, :create, :show]
    before_action :find_influencer, only: [:show]
  
    def index
        # byebug
        @influencers = Influencer.search(params[:influencer])
        # byebug
    end

    def show
        @influencer = Influencer.find(params[:id])
    end

    def profile
        @current_user = Influencer.find(session[:influencer_id])
        render :show
    end

    def new
        @influencer = Influencer.new
    end

    def create
        @influencer = Influencer.new (influencer_params)
        if @influencer.save
            flash[:notice] = "Signup Successful! Welcome, #{@influencer.name}"
            session[:influencer_id] = @influencer.id
            
            redirect_to @influencer
        else 
            flash[:errors] = @influencer.errors.full_messages
            redirect_to new_influencer_path
<<<<<<< HEAD
        end   
        
        # uploaded_file = params[:influencer][:image_url]
        #     File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
        #     file.write(uploaded_file.read)
        # end
=======
        end 
>>>>>>> andrew9
    end

    def edit
        @influencer = Influencer.find(params[:id])
    end

    def update
        @influencer = Influencer.find(params[:id])
        if @influencer.update(influencer_params)
            flash[:notice] = "Successfully updated profile"
            redirect_to @influencer
        else 
            flash[:errors] = @influencer.errors.full_messages
            redirect_to edit_influencer_path(@influencer)
        end     
    end

    def destroy
        @influencer = Influencer.find(params[:id])
        flash[:notice] = "Deleted account for #{@influencer.name}"
        @influencer.destroy

        redirect_to influencers_path
    end

    private

    def find_influencer
        @influencer = Influencer.find(params[:id])
    end

    def influencer_params
        params.require(:influencer).permit(:name, :role, :age, :gender, :social_media, :sport, :location, :image_url, :password)
    end

end
