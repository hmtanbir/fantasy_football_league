require 'rails_helper'

RSpec.describe Standing, type: :model do
  it { is_expected.to belong_to :game_session }
  it { is_expected.to validate_presence_of :team }

  let(:season) { FactoryBot.create :game_session }
  let(:standing) { FactoryBot.create :standing, game_session_id: season.id }

  describe ".check_object" do
    before do
      standing
    end

    it "includes standing object" do
      expect(Standing.check_object(standing.team,season.id)).to include(standing)
    end

    it "returns empty array for non-standing object" do
      expect(Standing.check_object('test',1)).to eq([])
    end
  end
end
