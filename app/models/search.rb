class Search < ApplicationRecord

  def self.search(keywords, category_id)
    table_of_ids_title = []
    table_of_ids_cats = []
    merged_table_of_tips_ids = []
    results = []
    i = 0

    tips_by_keyword = Tip.where(["title LIKE?",keywords]) if keywords.present?
    tips_by_cat = Category.where(["id = :id",{id:category_id}]) if category_id.present?
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
