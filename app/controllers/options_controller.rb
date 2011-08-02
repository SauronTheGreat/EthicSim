class OptionsController < ApplicationController
  # GET /options
  # GET /options.xml
  def index
	if (params[:qid].nil?)
	  @options=Option.all
	else
	  @question=Question.find(params[:qid])
	  @options = @question.options

	end
	@no_of_options=0
	if (@question.type_id != 3)
	  if (@question.type_id==1)
		@no_of_options=4

	  else
		@no_of_options=2
	  end
	end

	respond_to do |format|
	  format.html # index.html.erb
	  format.xml { render :xml => @options }
	end
  end

  # GET /options/1
  # GET /options/1.xml
  def show
	@option = Option.find(params[:id])


	respond_to do |format|
	  format.html # show.html.erb
	  format.xml { render :xml => @option }
	end
  end

  # GET /options/new
  # GET /options/new.xml
  def new
	@option = Option.new
	@question=Question.find(params[:question_id])
	@questionnaire_question=QuestionnaireQuestion.find_by_question_id(@question.id)
	@questionnaire_id=@questionnaire_question.questionnaire_id
	respond_to do |format|
	  format.html # new.html.erb
	  format.xml { render :xml => @option }
	end
  end

  # GET /options/1/edit
  def edit

	@option = Option.find(params[:id])
  end

  # POST /options
  # POST /options.xml
  def create
	@option = Option.new(params[:option])
	@option_count=Option.find_all_by_question_id(@option.question_id).count
	@option.option_number=@option_count+1

	respond_to do |format|
	  if @option.save
		format.html { redirect_to new_option_path(:question_id=>@option.question_id) }
		format.xml { render :xml => @option, :status => :created, :location => @option }


	  else
		format.html { render :action => "new" }
		format.xml { render :xml => @option.errors, :status => :unprocessable_entity }
	  end
	end
  end

  # PUT /options/1
  # PUT /options/1.xml
  def update
	@option = Option.find(params[:id])

	respond_to do |format|
	  if @option.update_attributes(params[:option])
		format.html { redirect_to(@option, :notice => 'Options were successfully updated.') }
		format.xml { head :ok }
	  else
		format.html { render :action => "edit" }
		format.xml { render :xml => @option.errors, :status => :unprocessable_entity }
	  end
	end
  end

  # DELETE /options/1
  # DELETE /options/1.xml
  def destroy
	@option = Option.find(params[:id])
	@qid=@option.question_id
	@option.destroy

	respond_to do |format|
	  format.html { redirect_to(options_url(:qid=>@qid)) }
	  format.xml { head :ok }
	end
  end
end
