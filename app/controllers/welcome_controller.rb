class WelcomeController < ApplicationController

  def index
	@welcome_educator = FacilitatorInput.first(:conditions => ['location=?', 'welcome_educator'])
	if !@welcome_educator.nil?
	  @welcome_educator=@welcome_educator.body
	end
	@games=Array.new
	@student_groups_users=(StudentGroupUser.find_all_by_user_id(current_user.id))
	@student_groups_users.each do |sgu|
	  @games << Game.find_by_student_group_id(sgu.student_group_id)

	end


  end

  def landing_page
	@game=Game.find(params[:active_game])
	@student_group=StudentGroup.find(@game.student_group_id)
	@facilitator_input=FacilitatorInput.find(:all, :conditions => ['student_group_id = ? and location = ?', @student_group.id, "welcome_student"])
	if !@facilitator_input.blank?
	  @welcome_message= FacilitatorInput.find(:first, :conditions => ['student_group_id = ? and location = ?', @student_group.id, "welcome_student"]).body

	end

  end
end