class BrandsController < ApplicationController

    def index
        @brands = Brand.all
    end

    def show
        @brand = Brand.find(params[:id])
    end

    def new
        @brand = Brand.new
    end

    def create
        @brand = Brand.create(brand_params)
        if @brand.valid?
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
            redirect_to @brand
        else 
            flash[:errors] = @brand.errors.full_messages
            redirect_to edit_brand_path(@brand)
        end     
    end

    def destroy
        @brand = Brand.find(params[:id])
        @brand.destroy

        redirect_to brands_path
    end

    private

    def brand_params
        params.require(:brand).permit(:name, :year_founded, :description)
    end

end
