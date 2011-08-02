class StudentGroupUser < ActiveRecord::Base
belongs_to :user
  belongs_to :student_group

  validates_presence_of :user_id,:message => "Id can't be Blank"
  validates_numericality_of :user_id,:message => "should be a integer"
end
