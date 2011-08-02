class RemoveQuestionnaireIdFromQuestion < ActiveRecord::Migration
  def self.up
	remove_column :questions,:questionnaire_id
  end

  def self.down
  end
end
