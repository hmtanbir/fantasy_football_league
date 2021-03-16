require 'rails_helper'

RSpec.describe GameSession, type: :model do
  it { is_expected.to validate_presence_of :period }
  it { is_expected.to validate_uniqueness_of(:period) }
end
