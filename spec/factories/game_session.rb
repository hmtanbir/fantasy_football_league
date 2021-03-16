# frozen_string_literal: true

# spec/factories/game_seesion.rb
FactoryBot.define do
  factory :game_session do
    period { FFaker.name }
  end
end