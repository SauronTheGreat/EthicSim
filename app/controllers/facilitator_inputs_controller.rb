class FacilitatorInputsController < ApplicationController
  # GET /facilitator_inputs
  # GET /facilitator_inputs.xml
  def index
    @facilitator_inputs = FacilitatorInput.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @facilitator_inputs }
    end
  end

  # GET /facilitator_inputs/1
  # GET /facilitator_inputs/1.xml
  def show
    @facilitator_input = FacilitatorInput.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @facilitator_input }
    end
  end

  # GET /facilitator_inputs/new
  # GET /facilitator_inputs/new.xml
  def new
    @facilitator_input = FacilitatorInput.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @facilitator_input }
    end
  end

  # GET /facilitator_inputs/1/edit
  def edit
    @facilitator_input = FacilitatorInput.find(params[:id])
  end

  # POST /facilitator_inputs
  # POST /facilitator_inputs.xml
  def create
    @facilitator_input = FacilitatorInput.new(params[:facilitator_input])

    respond_to do |format|
      if @facilitator_input.save
        format.html { redirect_to(@facilitator_input, :notice => 'Facilitator input was successfully created.') }
        format.xml  { render :xml => @facilitator_input, :status => :created, :location => @facilitator_input }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @facilitator_input.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /facilitator_inputs/1
  # PUT /facilitator_inputs/1.xml
  def update
    @facilitator_input = FacilitatorInput.find(params[:id])

    respond_to do |format|
      if @facilitator_input.update_attributes(params[:facilitator_input])
        format.html { redirect_to(@facilitator_input, :notice => 'Facilitator input was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @facilitator_input.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /facilitator_inputs/1
  # DELETE /facilitator_inputs/1.xml
  def destroy
    @facilitator_input = FacilitatorInput.find(params[:id])
    @facilitator_input.destroy

    respond_to do |format|
      format.html { redirect_to(facilitator_inputs_url) }
      format.xml  { head :ok }
    end
  end
end
