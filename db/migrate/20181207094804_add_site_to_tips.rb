class AddSiteToTips < ActiveRecord::Migration[5.2]
  def change
    add_column :tips, :site, :string
  end
end
