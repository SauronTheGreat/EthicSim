class CreateFacilitatorGroups < ActiveRecord::Migration
  def self.up
    create_table :facilitator_groups do |t|
      t.integer :client_id
      t.string :name
      t.integer :facilitator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :facilitator_groups
  end
end
