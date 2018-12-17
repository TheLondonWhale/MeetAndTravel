require 'pry'
class Search < ApplicationRecord

  def self.search(keywords, category_id,city,country)
    
    ids = if keywords.present? && category_id.present?
            Tip.keywords(keywords).pluck(:id) & Category.category_id(category_id).pluck(:id)

          elsif [keywords.downcase, category_id, city, country].any?(&:present?)

            tips = Tip
            tips = tips.country(country)
            tips = tips.city(city)
            if category_id.present?
              tips = Category.find_by(id: category_id).tips
            end
            tips = tips.keywords(keywords)
            tips.pluck(:id)
          else
            tips = Tip.all.pluck(:id)
          end

    Tip.find(ids.uniq)

  end
end
