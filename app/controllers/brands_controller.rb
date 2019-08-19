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
        redirect_to @brand
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def brand_params
        params.require(:brand).permit(:name, :year_founded, :description)
    end

end
