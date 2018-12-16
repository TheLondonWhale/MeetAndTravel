require 'pry'
class Search < ApplicationRecord

  def self.search(keywords, category_id,city,country)
    ids = if keywords.present? && category_id.present?
            Tip.keywords(keywords).pluck(:id) & Category.category_id(category_id).pluck(:id)

          elsif [keywords, category_id, city, country].any?(&:present?)
            tips = Tip
            tips = tips.country(country)
            tips = tips.city(city)
            tips = Category.find_by(category_id).tips
            tips = tips.keywords(keywords)
            tips.pluck(:id)
          else
            tips = Tip.all.pluck(:id)
          end

    Tip.find(ids.uniq)

  end
end
