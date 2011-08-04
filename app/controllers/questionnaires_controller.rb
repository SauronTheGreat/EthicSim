class QuestionnairesController < ApplicationController
  # GET /questionnaires
  # GET /questionnaires.xml
  def index
	@surveys = Questionnaire.find_all_by_user_id(current_user.id)


	respond_to do |format|
	  format.html # index.html.erb
	  format.xml { render :xml => @questionnaires }
	end
  end

  # GET /questionnaires/1
  # GET /questionnaires/1.xml
  def show
	@questionnaire = Questionnaire.find(params[:id])

	respond_to do |format|
	  format.html # show.html.erb
	  format.xml { render :xml => @questionnaire }
	end
  end

  # GET /questionnaires/new
  # GET /questionnaires/new.xml
  def new
	@questionnaire = Questionnaire.new

	respond_to do |format|
	  format.html # new.html.erb
	  format.xml { render :xml => @questionnaire }
	end
  end

  # GET /questionnaires/1/edit
  def edit
	@questionnaire = Questionnaire.find(params[:id])
  end

  # POST /questionnaires
  # POST /questionnaires.xml
  def create
	@questionnaire = Questionnaire.new(params[:questionnaire])

	respond_to do |format|
	  if @questionnaire.save
		format.html { redirect_to new_question_path(:questionnaire_id=>@questionnaire.id, :notice => 'Questionnaire was successfully created.') }
		format.xml { render :xml => @questionnaire, :status => :created, :location => @questionnaire }
	  else
		format.html { render :action => "new" }
		format.xml { render :xml => @questionnaire.errors, :status => :unprocessable_entity }
	  end
	end
  end

  # PUT /questionnaires/1
  # PUT /questionnaires/1.xml
  def update
	@questionnaire = Questionnaire.find(params[:id])

	respond_to do |format|
	  if @questionnaire.update_attributes(params[:questionnaire])
		format.html { redirect_to(@questionnaire, :notice => 'Questionnaire was successfully updated.') }
		format.xml { head :ok }
	  else
		format.html { render :action => "edit" }
		format.xml { render :xml => @questionnaire.errors, :status => :unprocessable_entity }
	  end
	end
  end

  # DELETE /questionnaires/1
  # DELETE /questionnaires/1.xml
  def destroy
	@questionnaire = Questionnaire.find(params[:id])
	@questionnaire.destroy

	respond_to do |format|
	  format.html { redirect_to(questionnaires_url) }
	  format.xml { head :ok }
	end
  end

  def selection_mode

	@sgid=params[:sgid]
	@flag=params[:flag]
  end

  def questionnaire_selection
	@questionnaires=Questionnaire.find_all_by_user_id(current_user.id)


  end

  def use_questionnaire
	@student_group=StudentGroup.find(params[:sgid])
	if (params[:questionnaire]=="PreQuestionnaire")
	  @student_group.pre_questionnaire_id=params[:questionnaire_id]
	  survey_type="PreQuestionnaire"
	elsif (params[:questionnaire]=="PostQuestionnaire")
	  @student_group.post_questionnaire_id=params[:questionnaire_id]
	  survey_type="PostQuestionnaire"
	else
	  @student_group.quiz_id=params[:questionnaire_id]
	  survey_type="Quiz"


	end
	@student_group.save!
	redirect_to student_group_path(@student_group, :notice=>"Successfully Added #{survey_type}")

  end

  def list_questions
	@questionnaire=Questionnaire.find(params[:questionnaire_id])
	@questions=@questionnaire.questions

  end


end
