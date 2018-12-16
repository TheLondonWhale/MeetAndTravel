class CategoryToTip < ApplicationRecord
  belongs_to :category, inverse_of: :category_to_tips
  belongs_to :tip, inverse_of: :category_to_tips

  
end
