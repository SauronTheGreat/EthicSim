class WelcomeController < ApplicationController

  def index
	@welcome_educator = FacilitatorInput.first(:conditions => ['location=?', 'welcome_educator'])
	if !@welcome_educator.nil?
	  @welcome_educator=@welcome_educator.body
	end
	@games=Array.new
	@games_played=Array.new

	#@student_groups_users=(StudentGroupUser.find_all_by_user_id(current_user.id))
	#@student_groups_users.each do |sgu|
	#  @player=Player.find(:all,:conditions => ['user_id=? and student_group_id=?',User.find(sgu.user_id).id,sgu.student_group_id])
	#  if(Player.find_by_user_id(User.find(sgu.user_id)).pending)
	#  @games << Game.find_by_student_group_id(sgu.student_group_id)
	#	end
	#
	#end
	@players=Player.find_all_by_user_id(current_user.id)

	@players.each do |player|
	  if(player.pending?)
		@games << Game.find(player.game_id)
	  else
		@games_played <<  Game.find(player.game_id)
	  end
	end



  end

  def landing_page
	@game=Game.find(params[:active_game])
	@player=Player.find(:first,:conditions => ["game_id=? and user_id =?",@game.id,current_user.id])
	@player.pending=false
	@player.save
	@student_group=StudentGroup.find(@game.student_group_id)
	@facilitator_input=FacilitatorInput.find(:all, :conditions => ['student_group_id = ? and location = ?', @student_group.id, "welcome_student"])
	if !@facilitator_input.blank?
	  @welcome_message= FacilitatorInput.find(:first, :conditions => ['student_group_id = ? and location = ?', @student_group.id, "welcome_student"]).body

	end

  end
end