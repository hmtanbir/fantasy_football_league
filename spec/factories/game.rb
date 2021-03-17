# frozen_string_literal: true

# spec/factories/game.rb
FactoryBot.define do
  factory :game do
    match_number { rand(2) }
    home_team { FFaker::Name.name }
    away_team { FFaker::Name.name }
    home_team_goal { 4 }
    away_team_goal { 3 }
    game_date { FFaker::Time.date }

    association :game_session
  end
end