class Tip < ApplicationRecord
  has_many :category_to_tips
  has_many :categories, through: :category_to_tips
end
