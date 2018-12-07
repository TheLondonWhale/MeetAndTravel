class Comment < ApplicationRecord
  belongs_to :tip, counter_cache: true
  belongs_to :user

  def comment_time
    created_at.strftime("le %d/%m/%y à %Hh%M")
  end
end
