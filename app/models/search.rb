class Search < ApplicationRecord

  def self.search(keywords, category_id,country,city)
    table_of_ids_city = []
    table_of_ids_country = []
    table_of_ids_title = []
    table_of_ids_cats = []
    merged_table_of_tips_ids = []
    results = []


    tips_by_keyword = Tip.where(["title LIKE?",keywords]) if keywords.present?
    tips_by_city = Tip.where(["city LIKE?",keywords]) if city.present?
    tips_by_country = Tip.where(["country LIKE?",keywords]) if country.present?
    tips_by_cat = Category.where(["id = :id",{id:category_id}]) if category_id.present?

    if tips_by_city != nil
      tips_by_city.each do |tip|
        tip.id
        table_of_ids_city << tip.id
      end
    end

    if tips_by_country != nil
      tips_by_country.each do |tip|
        tip.id
        table_of_ids_country << tip.id
      end
    end

    if tips_by_keyword != nil
      tips_by_keyword.each do |tip|
        tip.id
        table_of_ids_title << tip.id
      end
    end

    if tips_by_cat != nil
      Category.find(tips_by_cat[0].id).tips.each do |tip|
        table_of_ids_cats << tip.id
      end
    end

merged_table_of_tips_ids = [table_of_ids_title, table_of_ids_cats].flatten

merged_table_of_uniq_tips_ids = merged_table_of_tips_ids.uniq

 merged_table_of_uniq_tips_ids.each do |tip|
   result = Tip.find(tip)
   results << result
 end

    return results
  end
end
