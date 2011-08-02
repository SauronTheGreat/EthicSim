class AddOptionNumberToOption < ActiveRecord::Migration
  def self.up
    add_column :options, :option_number, :integer
  end

  def self.down
    remove_column :options, :option_number
  end
end
