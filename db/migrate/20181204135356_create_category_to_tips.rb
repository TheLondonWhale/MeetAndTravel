class CreateCategoryToTips < ActiveRecord::Migration[5.2]
  def change
    create_table :category_to_tips do |t|
      t.belongs_to :tip, index: :true
      t.belongs_to :category, index: :true

      t.timestamps
    end
  end
end
