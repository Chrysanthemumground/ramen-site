class StoneTagRelation < ApplicationRecord
  belongs_to :stone
  belongs_to :tag
end
