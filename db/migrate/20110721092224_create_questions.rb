class CreateQuestions < ActiveRecord::Migration
  def self.up
	create_table :questions do |t|
	  t.text :statement
	  t.integer :answer
	  t.integer :questionnaire_id
	  t.integer :type_id
	  t.integer :category_id

	  t.timestamps
	end
  end

  def self.down
	drop_table :questions
  end
end
