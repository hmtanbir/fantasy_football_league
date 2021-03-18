require 'rails_helper'

RSpec.describe HomeHelper, type: :helper do
  describe "#point_calc" do
    it "calculates a point" do
      expect(point_calc(3,1)).to eq(10)
    end
  end
end
