class BrandsController < ApplicationController
    #added for login/logout etc...
    skip_before_action :authorized, only: [:index, :new, :create, :show]
    before_action :find_brand, only: [:show]

    def index
        @brands = Brand.all
    end

    def show
        @brand = Brand.find(params[:id])
    end

    def profile_b
        @current_user = Brand.find(session[:brand_id])
        render :show
    end

    def new
        @brand = Brand.new
    end

    def create
        @brand = Brand.create(brand_params)
        if @brand.valid?
            flash[:notice] = "Signup Successful! Welcome, #{@brand.name}"
            session[:brand_id] = @brand.id
            redirect_to @brand
        else 
            flash[:errors] = @brand.errors.full_messages
            redirect_to new_brand_path
        end 
    end

    def edit
        @brand = Brand.find(params[:id])
    end

    def update
        @brand = Brand.find(params[:id])
        if @brand.update(brand_params)
            flash[:notice] = "Successfully updated profile"
            redirect_to @brand
        else 
            flash[:errors] = @brand.errors.full_messages
            redirect_to edit_brand_path(@brand)
        end      
    end

    def destroy
        @brand = Brand.find(params[:id])
        flash[:notice] = "Deleted account for #{@brand.name}"
        @brand.destroy
        redirect_to brands_path
    end

    private

    def find_brand
        @brand = Brand.find(params[:id])
    end

    def brand_params
        params.require(:brand).permit(:name, :year_founded, :description, :password)
    end

end
