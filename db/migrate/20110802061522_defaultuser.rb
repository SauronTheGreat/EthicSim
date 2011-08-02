class Defaultuser < ActiveRecord::Migration
  def self.up

	User.create(:first_name=>"Admin",:last_name=>"Admin",:email=>"admin@ptotem.com",:username=>"admin",:password=>"p20o20e13",:password_confirmation=>"p20o20e13",:facilitator_group_id=>1,:admin=>true)
  end

  def self.down
  end
end
