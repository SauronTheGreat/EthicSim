class FacilitatorGroupsController < ApplicationController
  # GET /facilitator_groups
  # GET /facilitator_groups.xml
  def index


	@facilitator_groups = FacilitatorGroup.all


	respond_to do |format|
	  format.html # index.html.erb
	  format.xml { render :xml => @facilitator_groups }
	end
  end

	# GET /facilitator_groups/1
	# GET /facilitator_groups/1.xml
  def show
	@facilitator_group = FacilitatorGroup.find(params[:id])

	respond_to do |format|
	  format.html # show.html.erb
	  format.xml { render :xml => @facilitator_group }
	end
  end

	# GET /facilitator_groups/new
	# GET /facilitator_groups/new.xml
  def new
	@facilitator_group = FacilitatorGroup.new

	respond_to do |format|
	  format.html # new.html.erb
	  format.xml { render :xml => @facilitator_group }
	end
  end

	# GET /facilitator_groups/1/edit
  def edit
	@facilitator_group = FacilitatorGroup.find(params[:id])
  end

	# POST /facilitator_groups
	# POST /facilitator_groups.xml
  def create
	@facilitator_group = FacilitatorGroup.new(params[:facilitator_group])

	respond_to do |format|
	  if @facilitator_group.save

		format.html { redirect_to(@facilitator_group, :notice => 'Facilitator group was successfully created.') }
		format.xml { render :xml => @facilitator_group, :status => :created, :location => @facilitator_group }
	  else
		format.html { render :action => "new" }
		format.xml { render :xml => @facilitator_group.errors, :status => :unprocessable_entity }
	  end
	end
  end

	# PUT /facilitator_groups/1
	# PUT /facilitator_groups/1.xml
  def update
	@facilitator_group = FacilitatorGroup.find(params[:id])

	respond_to do |format|
	  if @facilitator_group.update_attributes(params[:facilitator_group])
		format.html { redirect_to(@facilitator_group, :notice => 'Facilitator group was successfully updated.') }
		format.xml { head :ok }
	  else
		format.html { render :action => "edit" }
		format.xml { render :xml => @facilitator_group.errors, :status => :unprocessable_entity }
	  end
	end
  end

	# DELETE /facilitator_groups/1
	# DELETE /facilitator_groups/1.xml
  def destroy
	@facilitator_group = FacilitatorGroup.find(params[:id])
	@facilitator_group.destroy

	respond_to do |format|
	  format.html { redirect_to(facilitator_groups_url) }
	  format.xml { head :ok }
	end
  end
end
