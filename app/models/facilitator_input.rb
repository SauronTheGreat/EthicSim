class FacilitatorInput < ActiveRecord::Base

  #validatations

  validates_presence_of :body

  validates_presence_of :location
  validates_presence_of :student_group_id


end
