class Player < ActiveRecord::Base
  belongs_to :game
  has_many :player_answers, :dependent => :destroy

  #Validations
  validates_presence_of :game_id
  validates_presence_of :user_id


  validates_numericality_of :game_id, :message => "should be a integer"

end
