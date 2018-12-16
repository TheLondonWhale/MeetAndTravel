class Search < ApplicationRecord

  def self.search(keywords, category_id,city,country)
    ids = if keywords.present? && category_id.present?
            Tip.keywords(keywords).pluck(:id) & Category.category_id(category_id).pluck(:id)
          elsif [keywords, category_id, city, country].any?(&:present?)
            tips = Tip
            tips = tips.country(country)
            tips = tips.city(city)
            tips = tips.keywords(keywords)
            tips.pluck(:id)
          else
            []
          end

    Tip.find(ids.uniq)
  end
end
