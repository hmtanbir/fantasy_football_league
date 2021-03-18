# frozen_string_literal: true

# spec/factories/standing.rb
FactoryBot.define do
  factory :standing do
    team { FFaker::Name.name }
    match_played { 2 }
    win { 1 }
    lose { 0 }
    draw { 1 }
    gf { 4 }
    ga { 1 }
    gd { 3 }

    association :game_session
  end
end
