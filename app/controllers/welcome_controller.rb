class WelcomeController < ApplicationController

  def index
    @welcome_student = FacilitatorInput.first(:conditions => ['location=?', 'welcome_student']).nil? ? "" : @welcome_student.body
    if @welcome_educator = FacilitatorInput.first(:conditions => ['location=?', 'welcome_educator'])
      @welcome_educator=@welcome_educator.body
    end
  end

end
