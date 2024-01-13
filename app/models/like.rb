class Like < ApplicationRecord
  belongs_to :stone
  belongs_to :user

  validates_uniqueness_of :stone_id, scope: :user_id

end
