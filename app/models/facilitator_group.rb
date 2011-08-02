class FacilitatorGroup < ActiveRecord::Base
belongs_to :client
  has_many :student_groups , :dependent => :destroy
  has_many :users,:dependent => :destroy
  has_one :facilitator

  validates_presence_of :name
  validates_uniqueness_of :name


end
