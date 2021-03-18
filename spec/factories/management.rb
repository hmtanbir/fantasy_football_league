# frozen_string_literal: true

# spec/factories/management.rb
FactoryBot.define do
  factory :management do
    association :team
    association :player
    association :game_session
  end
end
