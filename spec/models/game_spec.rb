require 'rails_helper'

RSpec.describe Game, type: :model do
  it { is_expected.to belong_to :game_session }
  it { is_expected.to validate_presence_of :match_number }
  it { is_expected.to validate_presence_of :home_team }
  it { is_expected.to validate_presence_of :away_team }
  it { is_expected.to validate_presence_of :home_team_goal }
  it { is_expected.to validate_presence_of :away_team_goal }
  it { is_expected.to validate_presence_of :game_date }

  let(:season) { FactoryBot.create :game_session }
  let(:game) { FactoryBot.create :game, game_session_id: season.id }
  let(:game_with_same_team) { FactoryBot.create :game, home_team: 'a', away_team: 'a', game_session_id: season.id }

  describe "#validate_game" do
    it "returns a error message" do
      expect(game.validate_game).to match(['The match is already done'])
    end
  end

  describe "#validate_match_number" do
    it "returns a error message" do
      expect(game.validate_match_number).to match(['The match number is already taken'])
    end
  end

  describe "#validate_teams" do
    it "raises error for same team" do
      expect{game_with_same_team.validate_teams}.to raise_error(ActiveRecord::RecordInvalid,
                                                                'Validation failed: Two team are same')
    end

    it "returns a true for different team" do
      expect(game.validate_teams).to eq true
    end
  end
end
