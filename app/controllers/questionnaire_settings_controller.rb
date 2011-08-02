class QuestionnaireSettingsController < ApplicationController
  # GET /questionnaire_settings
  # GET /questionnaire_settings.xml
  def index
	@questionnaire=Questionnaire.find(params[:questionnaire_id])


    @questionnaire_settings = QuestionnaireSetting.find_all_by_questionnaire_id(@questionnaire.id)


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questionnaire_settings }
    end
  end

  # GET /questionnaire_settings/1
  # GET /questionnaire_settings/1.xml
  def show
    @questionnaire_setting = QuestionnaireSetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @questionnaire_setting }
    end
  end

  # GET /questionnaire_settings/new
  # GET /questionnaire_settings/new.xml
  def new
    @questionnaire_setting = QuestionnaireSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @questionnaire_setting }
    end
  end

  # GET /questionnaire_settings/1/edit
  def edit
    @questionnaire_setting = QuestionnaireSetting.find(params[:id])
  end

  # POST /questionnaire_settings
  # POST /questionnaire_settings.xml
  def create
    @questionnaire_setting = QuestionnaireSetting.new(params[:questionnaire_setting])

    respond_to do |format|
      if @questionnaire_setting.save
        format.html { redirect_to(@questionnaire_setting, :notice => 'Questionnaire setting was successfully created.') }
        format.xml  { render :xml => @questionnaire_setting, :status => :created, :location => @questionnaire_setting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @questionnaire_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /questionnaire_settings/1
  # PUT /questionnaire_settings/1.xml
  def update
    @questionnaire_setting = QuestionnaireSetting.find(params[:id])

    respond_to do |format|
      if @questionnaire_setting.update_attributes(params[:questionnaire_setting])
        format.html { redirect_to(@questionnaire_setting, :notice => 'Questionnaire setting was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @questionnaire_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /questionnaire_settings/1
  # DELETE /questionnaire_settings/1.xml
  def destroy
    @questionnaire_setting = QuestionnaireSetting.find(params[:id])
    @questionnaire_setting.destroy

    respond_to do |format|
      format.html { redirect_to(questionnaire_settings_url) }
      format.xml  { head :ok }
    end
  end
end
