# frozen_string_literal: true

# spec/factories/team.rb
FactoryBot.define do
  factory :team do
    name { FFaker::Name.name }
    city { FFaker::Address.city }
  end
end