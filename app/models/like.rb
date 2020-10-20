class Like < ApplicationRecord
  belongs_to :user
  belongs_to :nails

  validates :user_id, uniqueness: {scope: :post_id}
end
