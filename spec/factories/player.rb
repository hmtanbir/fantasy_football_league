# frozen_string_literal: true

# spec/factories/player.rb
FactoryBot.define do
  factory :player do
    name { FFaker::Name.name }
    age  { rand(2) }
    country { FFaker::Address.country }
    transfer_fees { rand(6) }
  end
end
