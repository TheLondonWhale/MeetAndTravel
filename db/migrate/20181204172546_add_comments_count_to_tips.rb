class AddCommentsCountToTips < ActiveRecord::Migration[5.2]
  def change
    add_column :tips, :comments_count, :integer, default: 0
  end
end
