class Management < ApplicationRecord
  belongs_to :team
  belongs_to :player
  belongs_to :game_session

  validate :validate_team_management, on: :create

  def validate_team_management
    check_match = Management.where(team_id: team_id, player_id: player_id, game_session_id: game_session_id)
    errors.add(:base, "The player is already added in this season") if check_match.present?
  end
end
