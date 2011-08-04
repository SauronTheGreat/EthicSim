class MatrixController < ApplicationController

  def index
	Temp.destroy_all
	j = 19


	if rand(2) == 0
	  toggle = -1
	else
	  toggle = 1
	end
	@r=Array.new
	(0..9).each do |i|
	  if i > 0
		x= @r[i-1]
	  else
		x=-1
	  end

	  y = [(x+1), (i*5)].max
	  @r[i] = (y+1)+rand(4)
	  @r[j] = 100-@r[i]
	  @r[i]=@r[i]+toggle
	  toggle=-toggle
	  j = j-1
	end
	4.times do |i|
	  @r << 0
	end
	perfect_spot = rand(20)
	@r << 100-@r[perfect_spot]


	@new_list =Array.new
	new_size= 25
	new_size.times do |i|
	  spot = rand(new_size)
	  @new_list << @r[spot]
	  @r.delete_at(spot)
	  new_size= @r.size

	end

	@new_list.each do |list|
	  @temp=Temp.new
	  @temp.option_value=list
	  @temp.save
	end


  end

  def add_sum

	@question=Question.find(params[:question_id])
	@temps=Temp.all
	@temps.each_with_index do |temp, index|
	  @option=Option.new
	  @option.name=temp.option_value
	  @option.question_id=@question.id
	  @option.option_number=(index+1)
	  @option.save
	end
	Temp.destroy_all
	@questionnaire=QuestionnaireQuestion.find_by_question_id(@question.id)
	@questionnaire_id=@questionnaire.questionnaire_id
	redirect_to new_question_path(:questionnaire_id=>@questionnaire_id)


  end

end

