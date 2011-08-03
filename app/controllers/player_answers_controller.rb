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

	@student_group=StudentGroup.find_by_facilitator_group_id(current_user.facilitator_group_id)
	@student_group_setting=StudentGroupSetting.find_by_student_group_id(@student_group.id)
	if (params[:questionnaire]=="PreQuestionnaire")
	  @questionnaire=Questionnaire.find(@student_group.pre_questionnaire_id)
	elsif (params[:questionnaire]=="PostQuestionnaire")
	  @questionnaire=Questionnaire.find(@student_group.post_questionnaire_id)
	else
	  @questionnaire=Questionnaire.find(@student_group.quiz_id)
	end

	count=@questionnaire.questions.count
	@questions=@questionnaire.questions
	if TempQuestion.all.count==0 && params[:time_out].nil? && params[:questionnaire]!="Closing"
	  @questions.each do |question|
		@temp_question=TempQuestion.new
		@temp_question.question_id=question.id
		@temp_question.statement=params[:questionnaire]
		@temp_question.save

	  end

	elsif !params[:time_out].nil?
	  @player_answer=PlayerAnswer.new
	  @player_answer.player_id=Player.find_by_user_id(current_user.id).id
	  @player_answer.question_id=TempQuestion.first.question_id
	  @player_answer.answer=0
	  @player_answer.answer_after_self_scoring=0
	  @player_answer.save
	  TempQuestion.destroy(:first)
	end

	#if(params[:questionnaire]=="PreQuestionnaire")
	#  @next_call="Quiz"
	#elsif params[:questionnaire]=="Quiz"
	#  @next_call=="PostQuestionnaire"
	#end
	if  !params[:time_out].nil?

	  if TempQuestion.all.count > 0
		redirect_to new_player_answer_path(:questionnaire=>"Quiz") and return
	  else
		redirect_to messaging_display_path(:questionnaire=>"PostQuestionnaire") and return

	  end
	end

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


	#@student_routing=StudentRouting.find_by_player_id(Player.find_by_game_id(@game.id).id)
	#@student_routing.pre_neg_taken=true
	#@student_routing.save
	    @next_call=TempQuestion.first.statement
	respond_to do |format|
	  if @player_answer.save

		TempQuestion.destroy(:first)

		if TempQuestion.all.count ==0
		  if @next_call=="PreQuestionnaire"
			@next_call="Quiz"
		  elsif @next_call=="Quiz"
			@next_call="PostQuestionnaire"
		  elsif @next_call=="PostQuestionnaire"
			format.html { redirect_to messaging_display_path(:questionnaire=>"Closing") }
			format.xml { render :xml => @player_answer, :status => :created, :location => @player_answer }
		  end


		  format.html { redirect_to messaging_display_path(:questionnaire=>@next_call) }
		  format.xml { render :xml => @player_answer, :status => :created, :location => @player_answer }
		else
		  if TempQuestion.first.statement=="PreQuestionnaire"
			format.html { redirect_to :controller => :player_answers, :action => 'new', :questionnaire=>"PreQuestionnaire" }
			format.xml { render :xml => @player_answer, :status => :created, :location => @player_answer }
		  elsif (TempQuestion.first.statement=="Quiz")
			format.html { redirect_to :controller => :player_answers, :action => 'new', :questionnaire=>"Quiz" }
			format.xml { render :xml => @player_answer, :status => :created, :location => @player_answer }
		  elsif (TempQuestion.first.statement=="PostQuestionnaire")
			format.html { redirect_to :controller => :player_answers, :action => 'new', :questionnaire=>"PostQuestionnaire" }
			format.xml { render :xml => @player_answer, :status => :created, :location => @player_answer }


		  end
		end

	  else
		format.html { redirect_to :action => "new",:questionnaire=>@next_call ,:alert=>"Oops.answer cannot be blank"}
	  end
	end
  end


  def createpost

	@player_answers = params[:player_answers].values.collect { |player_answer| PlayerAnswer.new(player_answer) }

	if @player_answers.all?(&:valid?)
	  @player_answers.each do |p|
		p.save


	  end

	end
	#@student_routing=StudentRouting.find_by_player_id(Player.find_by_game_id(@game.id).id)
	#@student_routing.post_neg_taken=true
	#@student_routing.save

	if @player_answers.all?(&:valid?)
	  respond_to do |format|
		format.html { redirect_to root_path }
		format.xml { render :xml => @player_answer, :status => :created, :location => @player_answer }
	  end
	else
	  respond_to do |format|
		format.html { redirect_to :action => "new" }
		format.xml { render :xml => @player_answer.errors, :status => :unprocessable_entity }
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



