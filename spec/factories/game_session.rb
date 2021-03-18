# frozen_string_literal: true

# spec/factories/game_session.rb
FactoryBot.define do
  factory :game_session do
    period { FFaker::Name.name }
  end
end
