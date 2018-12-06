class Tip < ApplicationRecord
  has_many :category_to_tips
  has_many :categories, through: :category_to_tips

  has_many :comments

  belongs_to :creator, class_name: "User"

  has_many :likes, dependent: :destroy

  def self.search(search)
    if search
      self.where("(tip.category_id) LIKE :search", search: "%#{search}%")
    else
      self.all
    end
  end

end
