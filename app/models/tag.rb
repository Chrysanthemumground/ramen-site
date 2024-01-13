class Tag < ApplicationRecord

    validates :name, presence: true
    has_many :stone_tag_relations, dependent: :destroy
    has_many :stones, through: :stone_tag_relations, dependent: :destroy

end
