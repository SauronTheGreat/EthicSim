class StudentGroupUsersController < ApplicationController
  # GET /student_group_users
  # GET /student_group_users.xml
  def index
	@student_group=StudentGroup.find(params[:sgid])
    #@student_group_users = StudentGroupUser.all
	@student_group_users = @student_group.student_group_users

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @student_group_users }
    end
  end

    # GET /student_group_users/1
    # GET /student_group_users/1.xml
  def show
    @student_group_user = StudentGroupUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @student_group_user }
    end
  end

    # GET /student_group_users/new
    # GET /student_group_users/new.xml
  def new
    @student_group=StudentGroup.find(params[:sgid])
    @users=User.find_all_by_facilitator_group_id(@student_group.facilitator_group_id)


    @student_group_users = Array.new(@users.count){ StudentGroupUser.new }

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @student_group_user }
    end
  end

    # GET /student_group_users/1/edit
  def edit
    @student_group_user = StudentGroupUser.find(params[:id])
  end

    # POST /student_group_users
    # POST /student_group_users.xml
  def create
    # @student_group_user = StudentGroupUser.new(params[:student_group_user])
    f=0
    @student_group_users = params[:student_group_users].values.collect { |sgu| StudentGroupUser.new(sgu) }
    @student_group_users.each do |o|
      if (!o.user_id.nil?)
        if o.save
          f=1
        else
          f=0
        end
      end
    end


    respond_to do |format|
      if f==1
        format.html { redirect_to(:controller=>:student_groups, :action=>'index', :notice => 'Student group user was successfully created.') }
        format.xml { render :xml => @student_group_user, :status => :created, :location => @student_group_user }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @student_group_user.errors, :status => :unprocessable_entity }
      end
    end
  end

    # PUT /student_group_users/1
    # PUT /student_group_users/1.xml
  def update
    @student_group_user = StudentGroupUser.find(params[:id])

    respond_to do |format|
      if @student_group_user.update_attributes(params[:student_group_user])
        format.html { redirect_to(@student_group_user, :notice => 'Student group user was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @student_group_user.errors, :status => :unprocessable_entity }
      end
    end
  end

    # DELETE /student_group_users/1
    # DELETE /student_group_users/1.xml
  def destroy
    @student_group_user = StudentGroupUser.find(params[:id])
    @student_group_user.destroy

    respond_to do |format|
      format.html { redirect_to(student_group_users_url) }
      format.xml { head :ok }
    end
  end
end
