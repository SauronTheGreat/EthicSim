class BulkImportController < ApplicationController

  def import
  end


  def pick_data
    require 'spreadsheet'

    @path = Import.save(params[:upload])

    #format
    #first_name last_name email password educator admin facilitator_group_id
    book = Spreadsheet.open "#{@path}"
    sheet1 = book.worksheet 0
    @user_list= Array.new

    sheet1.each 1 do |sheet|
      @user=User.new
      @user.first_name=sheet[0]
      @user.last_name=sheet[1]
      @user.email=sheet[2]
      @user.password=sheet[3]
      @user.password_confirmation=sheet[3]
      @user.educator=false
      @user.admin=false
      @users_facilitator = Facilitator.find_by_user_id(current_user.id)
      @user.facilitator_group_id=FacilitatorGroup.find_by_facilitator_id(@users_facilitator.id).id
      @user.save
      @user_list<<@user.first_name.titleize+" "+@user.last_name.titleize

    end
  end

end

