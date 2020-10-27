class Nail < ApplicationRecord
  belongs_to :user
  attachment :image

  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end

  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy

  def liked_by(user)
    puts user.inspect, '11111'
    Like.find_by(user_id: user.id, nail_id: id)
  end
end
