class AddUsernameToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :username, :string
	add_column :users, :admin, :boolean
	add_column :users, :educator, :boolean

  end

  def self.down
    remove_column :users, :username
  end
end
