class GameSession < ApplicationRecord
  validates :period, presence: true, uniqueness: true
  has_many :games
end
