class StudentGroupsController < ApplicationController
  # GET /student_groups
  # GET /student_groups.xml
  def index
	@student_groups = StudentGroup.all

	respond_to do |format|
	  format.html # index.html.erb
	  format.xml { render :xml => @student_groups }
	end
  end

  # GET /student_groups/1
  # GET /student_groups/1.xml
  def show
	@student_group = StudentGroup.find(params[:id])
	@facilitator_group=FacilitatorGroup.find(@student_group.facilitator_group_id)

	respond_to do |format|
	  format.html # show.html.erb
	  format.xml { render :xml => @student_group }
	end
  end

  # GET /student_groups/new
  # GET /student_groups/new.xml
  def new
	@student_group = StudentGroup.new

	respond_to do |format|
	  format.html # new.html.erb
	  format.xml { render :xml => @student_group }
	end
  end

  # GET /student_groups/1/edit
  def edit
	@student_group = StudentGroup.find(params[:id])
  end

  # POST /student_groups
  # POST /student_groups.xml
  def create
	@student_group = StudentGroup.new(params[:student_group])
	@student_groups = StudentGroup.all

	respond_to do |format|
	  if @student_group.save
		format.html { redirect_to student_groups_path, :notice => 'Student group was successfully created.' }
	  else
		format.html { render :action => "new" }
	  end
	end
  end

  # PUT /student_groups/1
  # PUT /student_groups/1.xml
  def update
	@student_group = StudentGroup.find(params[:id])

	respond_to do |format|
	  if @student_group.update_attributes(params[:student_group])
		format.html { redirect_to(@student_group, :notice => 'Student group was successfully updated.') }
		format.xml { head :ok }
	  else
		format.html { render :action => "edit" }
		format.xml { render :xml => @student_group.errors, :status => :unprocessable_entity }
	  end
	end
  end

  # DELETE /student_groups/1
  # DELETE /student_groups/1.xml
  def destroy
	@student_group = StudentGroup.find(params[:id])
	@student_group.destroy

	respond_to do |format|
	  format.html { redirect_to(student_groups_url) }
	  format.xml { head :ok }
	end
  end

  def confirm_game_creation
	@student_group=StudentGroup.find(params[:sgid])
	@student_group_users=@student_group.student_group_users

  end
end

