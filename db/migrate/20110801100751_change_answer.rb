class ChangeAnswer < ActiveRecord::Migration
  def self.up
	change_column :player_answers,:answer,:string
  end

  def self.down
  end
end
