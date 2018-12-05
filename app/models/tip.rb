class Tip < ApplicationRecord
  has_many :category_to_tips
  has_many :categories, through: :category_to_tips

  has_many :comments
  
  belongs_to :creator, class_name: "User"

  has_many :likes, dependent: :destroy

end
