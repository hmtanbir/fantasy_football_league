class Standing < ApplicationRecord
  belongs_to :game_session
  validates :team, presence: true

  scope :check_object, ->(team, season_id) { where(team: team, game_session_id: season_id) }
  scope :order_desc, -> { order(win: :desc, draw: :desc, gd: :desc) }
end
