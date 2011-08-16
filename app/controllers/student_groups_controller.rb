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

  require "spreadsheet"

  def download_data
	@student_group=StudentGroup.find(params[:sgid])
	@game=Game.find_by_student_group_id(@student_group.id)
	@players=@game.players


	book = Spreadsheet::Workbook.new
	sheet1 = book.create_worksheet
	index=1

	sheet1[0, 0]="Player Name"
	sheet1[0, 1]="Question"
	sheet1[0, 2]="Answer Given"
	sheet1[0, 3]="Correct Answer"
	sheet1[0, 4]="Cheated"


	@players.each do |player|

	  @player_answers=player.player_answers
	  format_cheated = Spreadsheet::Format.new :color => :red
	  format_clean=Spreadsheet::Format.new :color=>:green

	  @player_answers.each do |answer|
		if (answer.answer_type=="Quiz")
		  if answer.cheated
			sheet1.row(index).default_format=format_cheated
		  else
			sheet1.row(index).default_format=format_clean

		  end

		  sheet1[index, 0]=User.find(Player.find(answer.player_id).user_id).full_name
		  sheet1[index, 1]=Question.find(answer.question_id).statement
		  sheet1[index, 2]=answer.answer
		  sheet1[index, 3]=Question.find(answer.question_id).answer
		  if answer.cheated
			sheet1[index, 4]="YES"
		  else
			sheet1[index, 4]="NO"


		  end


		  index=index+1
		end


	  end

	end
	book.write "#{Rails.root}/public/download.xls"
	send_file ("#{Rails.root}/public/download.xls")


  end
end

