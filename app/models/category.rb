class Category < ApplicationRecord
  has_many :category_to_tips, inverse_of: :category
  has_many :tips, through: :category_to_tips
  
  scope :category_id, ->(category_id) {
    where(["id = :id",{id:category_id}])
  }


  def to_s
    name
  end
end
