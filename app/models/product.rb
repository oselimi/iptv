class Product < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :link,  presence: true, uniqueness: true
  has_one_attached :image
end
