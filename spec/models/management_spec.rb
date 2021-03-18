require 'rails_helper'

RSpec.describe Management, type: :model do
  it { is_expected.to belong_to :team }
  it { is_expected.to belong_to :player }
  it { is_expected.to belong_to :game_session }

  describe "#validate_team_management" do
    let(:management) { FactoryBot.create :management }

    it "returns a error message" do
      expect(management.validate_team_management).to match(['The player is already added in this season'])
    end
  end
end
