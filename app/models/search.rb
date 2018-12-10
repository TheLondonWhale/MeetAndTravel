class Search < ApplicationRecord

  def self.search(keywords, category_id)
  info_from_tip_table_with_tips = []

  tips = Tip.where(["name LIKE?",keywords]) if keywords.present?
  tips = CategoryToTip.where(["category_id = :id",{id:category_id}]) if category_id.present?

  tips.each do |d|
    d.tip_id
    info_from_tip_table_with_tips << Tip.find(d.tip_id)
  end
  return info_from_tip_table_with_tips
  end
end
