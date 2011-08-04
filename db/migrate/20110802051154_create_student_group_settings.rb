class CreateStudentGroupSettings < ActiveRecord::Migration
  def self.up
	create_table :student_group_settings do |t|
	  t.integer :student_group_id
	  t.integer :time_value

	  t.timestamps
	end
  end

  def self.down
	drop_table :student_group_settings
  end
end
