class SessionsController < ApplicationController
    skip_before_action :authorized, except: :destroy

  def new
  end

  def create
    # params {name: 'me', password: '1234'}
    # find influencer by the name found in params from the login form
    @influencer = Influencer.find_by({ name: params[:name] })

    # attempt to authenticate the influencer by name
    if !!@influencer && @influencer.authenticate(params[:password])
      flash[:notice] = "Successfully logged in #{@influencer.name}!"
      # store the logged in influencer somewhere
      session[:influencer_id] = @influencer.id
      redirect_to profile_path
    else
      flash[:notice] = "Invalid name or password"
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:influencer_id)
    redirect_to login_path
  end
end
