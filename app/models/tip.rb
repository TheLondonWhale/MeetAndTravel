require 'pry'
class Tip < ApplicationRecord
  has_many :category_to_tips, inverse_of: :tip
  has_many :categories, through: :category_to_tips

  accepts_nested_attributes_for :categories, reject_if: proc { |attributes| attributes[:name].blank? }, allow_destroy: true

  has_many :comments, dependent: :destroy

  belongs_to :creator, class_name: "User"

  has_many :likes, dependent: :destroy

  has_many_attached :pictures

  geocoded_by :fulladdress

  after_validation :geocode, if: ->(obj){ obj.fulladdress.present? }

  scope :country, ->(country) {
    where("lower(country) like?",country.downcase) if country.present?
  }

  scope :city, ->(city) {
    where("lower(city) like?",city.downcase) if city.present?
  }

  scope :keywords, ->(keywords) {
    where("lower(title) LIKE?","%#{keywords}%") if keywords.present?
  }

  def fulladdress
    [country, city, street].compact.join(', ')
  end

  def tip_time
    created_at.strftime("le %d/%m/%y à %Hh%M")
  end

  def time
    created_at.strftime("%d/%m/%y")
  end
end
