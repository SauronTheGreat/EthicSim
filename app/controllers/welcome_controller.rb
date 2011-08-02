class WelcomeController < ApplicationController

  def index
     @welcome_educator = FacilitatorInput.first(:conditions => ['location=?', 'welcome_educator'])
	if !@welcome_educator.nil?
      @welcome_educator=@welcome_educator.body
    end
  end

end
