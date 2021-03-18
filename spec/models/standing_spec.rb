require 'rails_helper'

RSpec.describe Standing, type: :model do
  it { is_expected.to belong_to :game_session }
  it { is_expected.to validate_presence_of :team }

  let(:season) { FactoryBot.create :game_session }
  let(:standing_one) { FactoryBot.create :standing, win: 4, draw: 2, game_session_id: season.id }
  let(:standing_two) { FactoryBot.create :standing, win: 5, draw: 1, game_session_id: season.id }

  before do
    standing_one
    standing_two
  end

  describe ".check_object" do
    it "includes standing object" do
      expect(Standing.check_object(standing_one.team,season.id)).to include(standing_one)
    end

    it "returns empty array for non-standing object" do
      expect(Standing.check_object('test',1)).to eq([])
    end
  end

  describe ".order_desc" do
    it "returns highest win object first" do
      expect(Standing.order_desc.first).to eq(standing_two)
    end

    it "returns lowest win object last" do
      expect(Standing.order_desc.last).to eq(standing_one)
    end
  end
end
