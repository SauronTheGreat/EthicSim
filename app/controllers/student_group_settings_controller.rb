class StudentGroupSettingsController < ApplicationController
  # GET /student_group_settings
  # GET /student_group_settings.xml
  def index
	@student_group_settings = StudentGroupSetting.all

	respond_to do |format|
	  format.html # index.html.erb
	  format.xml { render :xml => @student_group_settings }
	end
  end

  # GET /student_group_settings/1
  # GET /student_group_settings/1.xml
  def show
	@student_group_setting = StudentGroupSetting.find(params[:id])

	respond_to do |format|
	  format.html # show.html.erb
	  format.xml { render :xml => @student_group_setting }
	end
  end

  # GET /student_group_settings/new
  # GET /student_group_settings/new.xml
  def new
	@student_group_setting = StudentGroupSetting.new

	respond_to do |format|
	  format.html # new.html.erb
	  format.xml { render :xml => @student_group_setting }
	end
  end

  # GET /student_group_settings/1/edit
  def edit
	@student_group_setting = StudentGroupSetting.find(params[:id])
  end

  # POST /student_group_settings
  # POST /student_group_settings.xml
  def create
	@student_group_setting = StudentGroupSetting.new(params[:student_group_setting])

	respond_to do |format|
	  if @student_group_setting.save
		#format.html { redirect_to(@student_group_setting, :notice => 'Student group setting was successfully created.') }
		format.html { redirect_to(:controller=>:student_groups, :action=>'show', :id=>@student_group_setting.student_group_id, :notice => 'Student group setting was successfully created.') }
		format.xml { render :xml => @student_group_setting, :status => :created, :location => @student_group_setting }
	  else
		format.html { render :action => "new" }
		format.xml { render :xml => @student_group_setting.errors, :status => :unprocessable_entity }
	  end
	end
  end

  # PUT /student_group_settings/1
  # PUT /student_group_settings/1.xml
  def update
	@student_group_setting = StudentGroupSetting.find(params[:id])

	respond_to do |format|
	  if @student_group_setting.update_attributes(params[:student_group_setting])
		format.html { redirect_to(@student_group_setting, :notice => 'Student group setting was successfully updated.') }
		format.xml { head :ok }
	  else
		format.html { render :action => "edit" }
		format.xml { render :xml => @student_group_setting.errors, :status => :unprocessable_entity }
	  end
	end
  end

  # DELETE /student_group_settings/1
  # DELETE /student_group_settings/1.xml
  def destroy
	@student_group_setting = StudentGroupSetting.find(params[:id])
	@student_group_setting.destroy

	respond_to do |format|
	  format.html { redirect_to(student_group_settings_url) }
	  format.xml { head :ok }
	end
  end
end
