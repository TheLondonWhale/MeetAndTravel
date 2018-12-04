class CreateTips < ActiveRecord::Migration[5.2]
  def change
    create_table :tips do |t|
      t.string :title
      t.string :metadata
      t.text :description
      t.string :image
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
