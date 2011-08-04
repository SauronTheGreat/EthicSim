class CreateTempQuestions < ActiveRecord::Migration
  def self.up
	create_table :temp_questions do |t|
	  t.string :statement

	  t.timestamps
	end
  end

  def self.down
	drop_table :temp_questions
  end
end
