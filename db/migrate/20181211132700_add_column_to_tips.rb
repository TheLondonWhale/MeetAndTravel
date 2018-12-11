class AddColumnToTips < ActiveRecord::Migration[5.2]
  def change
    add_column :tips, :street, :string
    add_column :tips, :city, :string
    add_column :tips, :country, :string
  end
end
