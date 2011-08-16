class PlayerAnswersController < ApplicationController
  # GET /player_answers
  # GET /player_answers.xml
  def index
	@player_answers = PlayerAnswer.all

	respond_to do |format|
	  format.html # index.html.erb
	  format.xml { render :xml => @player_answers }
	end
  end

  # GET /player_answers/1
  # GET /player_answers/1.xml
  def show
	@player_answer = PlayerAnswer.find(params[:id])

	respond_to do |format|
	  format.html # show.html.erb
	  format.xml { render :xml => @player_answer }
	end
  end

  # GET /player_answers/new
  # GET /player_answers/new.xml
  def new


	#This identifies the student group which a player belongs to
	@student_group=StudentGroup.find(params[:sgid])


	#creating temporary timer to check whether a student has cheated or not.
	if TimerTemp.all.count==0
	  @timer=TimerTemp.new
	  @timer.time_value=Time.now
	  @timer.save!
	else
	  @timer=TimerTemp.first
	end


	#Use of a temp table to pass value of student group from new to create action
	if !Temp.find(:all).blank?
	  Temp.destroy_all
	end
	#Identify a particular game and then a specific player
	@game=Game.find_by_student_group_id(@student_group.id)
	@player=Player.find(:first, :conditions => ['game_id=? and user_id=?', @game.id, current_user.id])


	#inserting student group id in temp table
	@temp=Temp.new
	@temp.option_value=@student_group.id
	@temp.save

	#To find out any specific settings for a student group
	@student_group_setting=StudentGroupSetting.find_by_student_group_id(@student_group.id)

	#This snippet identifiies whcih qustionnaire to load ->pre survey,quiz or post survey
	#control will come here with params[:questionnaiire] as "PreQuestionnaire" on,y if group has a questionnaire else it will be "Quiz"

	if (params[:questionnaire]=="PreQuestionnaire")
	  @questionnaire=Questionnaire.find(@student_group.pre_questionnaire_id)
	elsif (params[:questionnaire]=="PostQuestionnaire")
	  if (!@student_group.post_questionnaire_id.nil?)
		@questionnaire=Questionnaire.find(@student_group.post_questionnaire_id)
	  else
		#If student group does not have a post questionnaire, go to closing page
		redirect_to messaging_display_path(:questionnaire=>"Closing", :sgid=>@student_group.id) and return
	  end
	else
	  @questionnaire=Questionnaire.find(@student_group.quiz_id)
	end


	count=@questionnaire.questions.count
	@questions=@questionnaire.questions
	#params[:time_out] has a value only if a student crosses his/her time limit

	#TempQuestiion is a temporary table used to store the questions which appear next
	if TempQuestion.all.count==0 && params[:time_out].nil? && params[:questionnaire]!="Closing"
	  @questions.each do |question|
		@temp_question=TempQuestion.new
		@temp_question.question_id=question.id
		@temp_question.statement=params[:questionnaire]
		@temp_question.save

	  end

	  #This means that player has missed the time deadline
	elsif !params[:time_out].nil?
	  @player_answer=PlayerAnswer.new
	  @player_answer.player_id=Player.find_by_user_id(current_user.id).id
	  @player_answer.question_id=TempQuestion.first.question_id
	  @player_answer.answer=0
	  @player_answer.answer_after_self_scoring=0
	  @player_answer.answer_type="Quiz"
	  if TimerTemp.all.count > 0
		@tempTimer=Time.now-TimerTemp.first.time_value
		if @tempTimer > 30
		  @player_answer.cheated=true

		end
  TimerTemp.destroy(:first)
	  end
	  @player_answer.save


	  TempQuestion.destroy(:first)

	end


	if  !params[:time_out].nil?
	  #This means that last question of QUIZ has been missed in terms of time by the student
	  if TempQuestion.all.count > 0
		redirect_to new_player_answer_path(:questionnaire=>"Quiz", :sgid=>params[:sgid]) and return
	  else
		if (!@student_group.post_questionnaire_id.nil?)
		  redirect_to messaging_display_path(:questionnaire=>"PostQuestionnaire", :sgid=>params[:sgid]) and return
		else
		  redirect_to messaging_display_path(:questionnaire=>"Closing", :sgid=>@student_group.id) and return

		end
	  end
	end

	#If control comes here , only then will the form be displayed!
	@player_answer = PlayerAnswer.new

	respond_to do |format|
	  format.html # new.html.erb
	  format.xml { render :xml => @player_answer }
	end
  end

  # GET /player_answers/1/edit
  def edit
	@player_answer = PlayerAnswer.find(params[:id])
  end

  # POST /player_answers
  # POST /player_answers.xml
  def create

	@player_answer = PlayerAnswer.new(params[:player_answer])

	#This is why temp table was used
	@student_group=StudentGroup.find(Temp.first.option_value)
	Temp.destroy_all
	#Now we dont need Temp.

	#This is the code to calculate sum of numbers checked in the matrix
	@sum=0
	s="check_box_"
	for i in 1..25
	  s=s+i.to_s
	  if (!params[s.to_sym].nil?)
		@sum=@sum+params[s.to_sym].to_i
	  end

	  s="check_box_"

	end


	if (@player_answer.answer.nil?)
	  @player_answer.answer=@sum
	end

	#The code for finding answer in matrix type question ends here ....


	#we are still not using student  routing table
	#@student_routing=StudentRouting.find_by_player_id(Player.find_by_game_id(@game.id).id)
	#@student_routing.pre_neg_taken=true
	#@student_routing.save

	if TimerTemp.all.count > 0
	  @tempTimer=Time.now-TimerTemp.first.time_value
	  if @tempTimer > 30
		@player_answer.cheated = true
	  else
		@player_answer.cheated = false
	  end
	TimerTemp.destroy(:first)
	end



	#The follwing code decided where to go next
	@next_call=TempQuestion.first.statement
	respond_to do |format|
	  if @player_answer.save
		TempQuestion.destroy(:first)

		#This will mean that one of the 3 parts is over
		#If PreQuestionnaire is over the Quiz must start.
		#If Quiz is over then POstQuestionnaire must start...but..
		if TempQuestion.all.count ==0
		  if @next_call=="PreQuestionnaire"
			@next_call="Quiz"
		  elsif @next_call=="Quiz"
			@next_call="PostQuestionnaire"
		  elsif @next_call=="PostQuestionnaire"
			format.html { redirect_to messaging_display_path(:questionnaire=>"Closing", :sgid=>@student_group.id) }
			format.xml { render :xml => @player_answer, :status => :created, :location => @player_answer }
		  end

		  #If we dont have a PostQuestionnaire,then we must go to closing page
		  if @next_call=="PostQuestionnaire"
			if @student_group.post_questionnaire_id.nil?
			  @next_call="Closing"
			end
		  end

		  #If we have a post Questionnaire then go there !
		  format.html { redirect_to messaging_display_path(:questionnaire=>@next_call, :sgid=>@student_group.id) }
		  format.xml { render :xml => @player_answer, :status => :created, :location => @player_answer }
		else
		  #This means that pre questionnaire is still not complete
		  #if TempQuestion.first.statement=="PreQuestionnaire"
		  #  format.html { redirect_to :controller => :player_answers, :action => 'new', :questionnaire=>"PreQuestionnaire", :sgid=>@student_group.id }
		  #  format.xml { render :xml => @player_answer, :status => :created, :location => @player_answer }
		  #elsif (TempQuestion.first.statement=="Quiz")
		  #  format.html { redirect_to :controller => :player_answers, :action => 'new', :questionnaire=>"Quiz", :sgid=>@student_group.id }
		  #  format.xml { render :xml => @player_answer, :status => :created, :location => @player_answer }
		  #elsif (TempQuestion.first.statement=="PostQuestionnaire")
		  #  format.html { redirect_to :controller => :player_answers, :action => 'new', :questionnaire=>"PostQuestionnaire", :sgid=>@student_group.id }
		  #  format.xml { render :xml => @player_answer, :status => :created, :location => @player_answer }
		  #
		  #
		  #end

		  format.html { redirect_to :controller => :player_answers, :action => 'new', :questionnaire=>TempQuestion.first.statement, :sgid=>@student_group.id }
		  format.xml { render :xml => @player_answer, :status => :created, :location => @player_answer }

		end

	  else
		#There is some error !!
		format.html { redirect_to :action => "new", :questionnaire=>@next_call, :alert=>"Oops.answer cannot be blank", :sgid=>@student_group.id }
	  end
	end
  end


  # PUT /player_answers/1
  # PUT /player_answers/1.xml
  def update
	@player_answer = PlayerAnswer.find(params[:id])

	respond_to do |format|
	  if @player_answer.update_attributes(params[:player_answer])
		format.html { redirect_to(@player_answer, :notice => 'Player answer was successfully updated.') }
		format.xml { head :ok }
	  else
		format.html { render :action => "edit" }
		format.xml { render :xml => @player_answer.errors, :status => :unprocessable_entity }
	  end
	end
  end

  # DELETE /player_answers/1
  # DELETE /player_answers/1.xml
  def destroy
	@player_answer = PlayerAnswer.find(params[:id])
	@player_answer.destroy

	respond_to do |format|
	  format.html { redirect_to(player_answers_url) }
	  format.xml { head :ok }
	end
  end
end



