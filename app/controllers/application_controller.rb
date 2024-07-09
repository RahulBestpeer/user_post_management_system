class ApplicationController < ActionController::Base
  before_action :user_authantication!

  def user_authantication!
    # debugger
    return if (params[:controller] == 'users' && param_action)

    if (session[:user_id] == nil)
      redirect_to controller: :users, action: :login_form
    end
  end


 def param_action
    ['new','login_form','create','login'].include?params[:action]
 end
end
