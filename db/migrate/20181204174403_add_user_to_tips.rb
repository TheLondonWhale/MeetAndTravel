class AddUserToTips < ActiveRecord::Migration[5.2]
  def change
    add_reference :tips, :creator, index: true
  end
end
