class AddQuizIdToStudentGroup < ActiveRecord::Migration
  def self.up
    add_column :student_groups, :quiz_id, :integer
  end

  def self.down
    remove_column :student_groups, :quiz_id
  end
end
