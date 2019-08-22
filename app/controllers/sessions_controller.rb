class SessionsController < ApplicationController
    skip_before_action :authorized, except: :destroy

  def new
  end

  def create
    # params {name: 'me', password: '1234'}
    # find influencer by the name found in params from the login form
    @influencer = Influencer.find_by({ name: params[:name] })
    #duplicating logic for brands
    @brand = Brand.find_by({ name: params[:name]})

    # attempt to authenticate the influencer by name
    if !!@influencer && @influencer.authenticate(params[:password])
      # byebug
      flash[:notice] = "Successfully logged in #{@influencer.name}!"
      # store the logged in influencer somewhere
      session[:influencer_id] = @influencer.id
      redirect_to @influencer
    elsif !!@brand && @brand.authenticate(params[:password])
      flash[:notice] = "Successfully logged in #{@brand.name}!"
      session[:brand_id] = @brand.id
      redirect_to @brand
    else
      flash[:notice] = "Invalid name or password"
      redirect_to login_path
    end
  end

  def destroy
    if session.delete(:influencer_id)
      redirect_to login_path
    elsif session.delete(:brand_id)
    #duplicating logic for brands
      redirect_to login_path
    end
  end
  
end
