class CreateClients < ActiveRecord::Migration
  def self.up
	create_table :clients do |t|
	  t.string :name
	  t.string :type_of_client

	  t.timestamps
	end
	#create a default client
	Client.create(:name=>"Ptotem Learning Projects", :type_of_client=>"Owner")
  end


  def self.down
	drop_table :clients
  end
end
