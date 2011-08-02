class StudentGroupQuestionnairesController < ApplicationController
  # GET /student_group_questionnaires
  # GET /student_group_questionnaires.xml
  def index
    @student_group_questionnaires = StudentGroupQuestionnaire.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @student_group_questionnaires }
    end
  end

  # GET /student_group_questionnaires/1
  # GET /student_group_questionnaires/1.xml
  def show
    @student_group_questionnaire = StudentGroupQuestionnaire.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student_group_questionnaire }
    end
  end

  # GET /student_group_questionnaires/new
  # GET /student_group_questionnaires/new.xml
  def new
    @student_group_questionnaire = StudentGroupQuestionnaire.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student_group_questionnaire }
    end
  end

  # GET /student_group_questionnaires/1/edit
  def edit
    @student_group_questionnaire = StudentGroupQuestionnaire.find(params[:id])
  end

  # POST /student_group_questionnaires
  # POST /student_group_questionnaires.xml
  def create
    @student_group_questionnaire = StudentGroupQuestionnaire.new(params[:student_group_questionnaire])

    respond_to do |format|
      if @student_group_questionnaire.save
        format.html { redirect_to(@student_group_questionnaire, :notice => 'Student group questionnaire was successfully created.') }
        format.xml  { render :xml => @student_group_questionnaire, :status => :created, :location => @student_group_questionnaire }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student_group_questionnaire.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /student_group_questionnaires/1
  # PUT /student_group_questionnaires/1.xml
  def update
    @student_group_questionnaire = StudentGroupQuestionnaire.find(params[:id])

    respond_to do |format|
      if @student_group_questionnaire.update_attributes(params[:student_group_questionnaire])
        format.html { redirect_to(@student_group_questionnaire, :notice => 'Student group questionnaire was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student_group_questionnaire.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /student_group_questionnaires/1
  # DELETE /student_group_questionnaires/1.xml
  def destroy
    @student_group_questionnaire = StudentGroupQuestionnaire.find(params[:id])
    @student_group_questionnaire.destroy

    respond_to do |format|
      format.html { redirect_to(student_group_questionnaires_url) }
      format.xml  { head :ok }
    end
  end
end
