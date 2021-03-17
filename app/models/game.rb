class Game < ApplicationRecord
  belongs_to :game_session
  validates :match_number,:home_team,:away_team,:home_team_goal,:away_team_goal, :game_date, presence: true
  validate :validate_game, :validate_match_number, :validate_teams, on: :create

  def validate_game
    check_match = Game.where(home_team: home_team, away_team: away_team, game_session_id: game_session_id)
    errors.add(:base, "The match is already done") if check_match.present?
  end

  def validate_match_number
    check_match_number = Game.where(match_number: match_number, game_session_id: game_session_id)
    errors.add(:base, "The match number is already taken") if check_match_number.present?
  end

  def validate_teams
    home_team === away_team ? errors.add(:base, "Two team are same"): true
  end
end
