require 'rails_helper'

RSpec.describe Player, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :country }
  it { is_expected.to validate_presence_of :age }
  it { is_expected.to validate_presence_of :transfer_fees }
  it { is_expected.to validate_uniqueness_of(:name) }
end
