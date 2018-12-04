class Comment < ApplicationRecord
  belongs_to :tip, counter_cache: true
  belongs_to :user
end
