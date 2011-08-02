class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  layout :layout

  private

  def layout
    # only turn it off for Sessions Pages
    if is_a?(Devise::SessionsController) || is_a?(Devise::RegistrationsController)
      "sessions"
    elsif is_a?(WelcomeController)
      "welcome"
    else
      "application"
    end
    # turn off layout for every DeviseController
    #devise_controller? && "application"
  end

end
