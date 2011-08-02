class FacilitatorInput < ActiveRecord::Base

  #validatations
  validates_uniqueness_of :body
  validates_presence_of :body
  validates_uniqueness_of :location
  validates_presence_of :location



end
