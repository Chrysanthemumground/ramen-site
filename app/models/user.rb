class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :stones, dependent: :destroy 
  has_many :likes, dependent: :destroy
  has_many :liked_stones, through: :likes, source: :stone

  def already_liked?(stone)
    self.likes.exists?(stone_id: stone.id)
  end

  has_many :comments, dependent: :destroy

end
