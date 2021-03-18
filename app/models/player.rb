class Player < ApplicationRecord
  validates :name, :country, :age, :transfer_fees, presence: true
  validates :name, uniqueness: true
end
