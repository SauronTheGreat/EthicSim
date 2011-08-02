class AddQuestionIdToTempQuestion < ActiveRecord::Migration
  def self.up
    add_column :temp_questions, :question_id, :integer
  end

  def self.down
    remove_column :temp_questions, :question_id
  end
end
