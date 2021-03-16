class GameSession < ApplicationRecord
  validates :period, presence: true, uniqueness: true
end
