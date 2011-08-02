class CreateFacilitators < ActiveRecord::Migration
  def self.up
    create_table :facilitators do |t|
      t.integer :user_id
      t.integer :facilitator_group_id

      t.timestamps
    end
  end

  def self.down
    drop_table :facilitators
  end
end
