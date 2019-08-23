class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?
  before_action :authorized

  def current_user
    @influencer = Influencer.find_by({ id: session[:influencer_id] })
    #adding brand logic
    #scrapping all this
    # @brand = Brand.find_by({ id: session[:brand_id]})
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

end
