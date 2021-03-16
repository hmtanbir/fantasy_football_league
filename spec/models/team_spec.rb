require 'rails_helper'

RSpec.describe Team, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :city }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to have_one_attached :image }
end
