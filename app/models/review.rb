class Review < ActiveRecord::Base
  belongs_to :product, required: true
  belongs_to :user, required:true

  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true
end
