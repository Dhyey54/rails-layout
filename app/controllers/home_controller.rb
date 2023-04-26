class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    if user_signed_in?
      @text1 = 'Products'
      @link1 = products_path

      @text2 = 'Orders'
      @link2 = orders_path
    else
      @text1 = 'Sign In'
      @link1 = new_user_session_path

      @text2 = 'Sign Up'
      @link2 = new_user_registration_path
    end
  end
end
