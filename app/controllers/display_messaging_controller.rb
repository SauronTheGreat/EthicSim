class DisplayMessagingController < ApplicationController
  def show_modes

  end


  def show_messages

	@student_group=StudentGroup.find(params[:sgid])
	if (params[:questionnaire]=="PreQuestionnaire")
	  @message=FacilitatorInput.find(:first, :conditions => ['student_group_id = ? and location = ?', @student_group.id, "instr_pre_quiz"])
	elsif (params[:questionnaire]=="Quiz")
	  @message=FacilitatorInput.find(:first, :conditions => ['student_group_id = ? and location = ?', @student_group.id, "instr_quiz"])
	elsif params[:questionnaire]=="PostQuestionnaire"
	  @message=FacilitatorInput.find(:first, :conditions => ['student_group_id = ? and location = ?', @student_group.id, "instr_post_quiz"])
	elsif params[:questionnaire]=="Closing"
	  @message=FacilitatorInput.find(:first, :conditions => ['student_group_id = ? and location = ?', @student_group.id, "instr_closing"])
	end

	if (!@message.nil?)
	  @message=@message.body
	end

  end
end

