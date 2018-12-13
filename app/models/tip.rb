class Tip < ApplicationRecord
  has_many :category_to_tips, inverse_of: :tip
  has_many :categories, through: :category_to_tips
  accepts_nested_attributes_for :categories, reject_if: proc { |attributes| attributes[:name].blank? }, allow_destroy: true

  has_many :comments

  belongs_to :creator, class_name: "User"

  has_many :likes, dependent: :destroy

  has_many_attached :pictures

  geocoded_by :fulladdress

  after_validation :geocode, if: ->(obj){ obj.fulladdress.present? }



  def fulladdress
    [country, city, street].compact.join(', ')
  end

  def tip_time
    created_at.strftime("le %d/%m/%y à %Hh%M")
  end
end
