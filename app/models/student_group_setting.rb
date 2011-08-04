class StudentGroupSetting < ActiveRecord::Base

  #Validations
  validates_presence_of :time_value, :message => "Time Cannot Be Blank"
  validates_presence_of :student_group_id
end
