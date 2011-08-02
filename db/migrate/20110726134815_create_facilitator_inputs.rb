class CreateFacilitatorInputs < ActiveRecord::Migration
  def self.up
    create_table :facilitator_inputs do |t|
      t.string :location
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :facilitator_inputs
  end
end
