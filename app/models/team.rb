class Team < ApplicationRecord
  validates :name, :city, presence: true
  validates :name, uniqueness: true

  has_one_attached :image
end
