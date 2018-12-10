class Category < ApplicationRecord
  has_many :category_to_tips
  has_many :tips, through: :category_to_tips
 

  def to_s
    name
  end
end
