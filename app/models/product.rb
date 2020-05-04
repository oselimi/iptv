class Product < ApplicationRecord
  belongs_to :user
  validates :title,   presence: true, uniqueness: true
  validates :link,    presence: true, uniqueness: true
  validates :user_id, presence: true
  has_one_attached :image
end
