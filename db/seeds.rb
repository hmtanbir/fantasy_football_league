# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# Seed for game season
s1 = GameSession.create(period: '2019-20')
s2 = GameSession.create(period: '2020-21')
#
# Seed for Player
p1 = Player.create( name: 'Hasan', country: 'Bangladesh', age: 29, transfer_fees: 100000)
p2 = Player.create( name: 'Mohammad', country: 'Bangladesh', age: 29, transfer_fees: 110000)
p3 = Player.create( name: 'Tanbir', country: 'Bangladesh', age: 29, transfer_fees: 120000)
#
# Seed for Team
t1 = Team.create(name: "Man City", city: "London")
t2 = Team.create(name: "Man United", city: "London")
t3 = Team.create(name: "Leicester City", city: "London")
t4 = Team.create(name: "Chelsea", city: "London")
t5 = Team.create(name: "West Ham", city: "London")
t6 = Team.create(name: "Liverpool", city: "London")
t7 = Team.create(name: "Everton", city: "London")
t8 = Team.create(name: "Tottenham", city: "London")
t9 = Team.create(name: "Aston Villa", city: "London")
t10 = Team.create(name: "Arsenal", city: "London")
t11 = Team.create(name: "Crystal Palace", city: "London")
t12 = Team.create(name: "Leeds United", city: "London")
t13 = Team.create(name: "Wolves", city: "London")
t14 = Team.create(name: "Southampton", city: "London")
t15 = Team.create(name: "Burnley", city: "London")
t16 = Team.create(name: "Brighton", city: "London")
t17 = Team.create(name: "Newcastle", city: "London")
t18 = Team.create(name: "Fulham", city: "London")
t19 = Team.create(name: "West Brom", city: "London")
t20 = Team.create(name: "Sheffield United", city: "London")

# seed for Management
Management.create(team_id: t1.id, player_id: p1.id, game_session_id: s1.id)
Management.create(team_id: t2.id, player_id: p2.id, game_session_id: s1.id)
Management.create(team_id: t3.id, player_id: p3.id, game_session_id: s1.id)
Management.create(team_id: t1.id, player_id: p3.id, game_session_id: s2.id)
Management.create(team_id: t2.id, player_id: p1.id, game_session_id: s2.id)
Management.create(team_id: t3.id, player_id: p2.id, game_session_id: s2.id)
#
# Seed for Team
Game.create(match_number: 1, home_team: t1.name, away_team: t2.name, home_team_goal: 1, away_team_goal: 0, game_date: '2021-03-18', game_session_id: s2.id)
Game.create(match_number: 2, home_team: t2.name, away_team: t1.name, home_team_goal: 0, away_team_goal: 3, game_date: '2021-03-18', game_session_id: s2.id)
Game.create(match_number: 3, home_team: t3.name, away_team: t4.name, home_team_goal: 2, away_team_goal: 1, game_date: '2021-03-18', game_session_id: s2.id)
Game.create(match_number: 4, home_team: t4.name, away_team: t3.name, home_team_goal: 1, away_team_goal: 1, game_date: '2021-03-18', game_session_id: s2.id)

# seed for standing table
Standing.create(team: t1.name, match_played: 2, win: 2, lose: 0, draw: 0, gf: 4, ga: 0, gd: 4, game_session_id: s2.id)
Standing.create(team: t2.name, match_played: 2, win: 0, lose: 0, draw: 0, gf: 1, ga: 0, gd: 1, game_session_id: s2.id)
Standing.create(team: t3.name, match_played: 2, win: 1, lose: 0, draw: 1, gf: 3, ga: 2, gd: 1, game_session_id: s2.id)
Standing.create(team: t4.name, match_played: 2, win: 0, lose: 0, draw: 1, gf: 2, ga: 3, gd: -1, game_session_id: s2.id)

Standing.create(team: t5.name, match_played: 0, win: 0, lose: 0, draw: 0, gf: 0, ga: 0, gd: 0, game_session_id: s2.id)
Standing.create(team: t6.name, match_played: 0, win: 0, lose: 0, draw: 0, gf: 0, ga: 0, gd: 0, game_session_id: s2.id)
Standing.create(team: t7.name, match_played: 0, win: 0, lose: 0, draw: 0, gf: 0, ga: 0, gd: 0, game_session_id: s2.id)
Standing.create(team: t8.name, match_played: 0, win: 0, lose: 0, draw: 0, gf: 0, ga: 0, gd: 0, game_session_id: s2.id)

Standing.create(team: t9.name, match_played: 0, win: 0, lose: 0, draw: 0, gf: 0, ga: 0, gd: 0, game_session_id: s2.id)
Standing.create(team: t10.name, match_played: 0, win: 0, lose: 0, draw: 0, gf: 0, ga: 0, gd: 0, game_session_id: s2.id)
Standing.create(team: t11.name, match_played: 0, win: 0, lose: 0, draw: 0, gf: 0, ga: 0, gd: 0, game_session_id: s2.id)
Standing.create(team: t12.name, match_played: 0, win: 0, lose: 0, draw: 0, gf: 0, ga: 0, gd: 0, game_session_id: s2.id)

Standing.create(team: t13.name, match_played: 0, win: 0, lose: 0, draw: 0, gf: 0, ga: 0, gd: 0, game_session_id: s2.id)
Standing.create(team: t14.name, match_played: 0, win: 0, lose: 0, draw: 0, gf: 0, ga: 0, gd: 0, game_session_id: s2.id)
Standing.create(team: t15.name, match_played: 0, win: 0, lose: 0, draw: 0, gf: 0, ga: 0, gd: 0, game_session_id: s2.id)
Standing.create(team: t16.name, match_played: 0, win: 0, lose: 0, draw: 0, gf: 0, ga: 0, gd: 0, game_session_id: s2.id)

Standing.create(team: t17.name, match_played: 0, win: 0, lose: 0, draw: 0, gf: 0, ga: 0, gd: 0, game_session_id: s2.id)
Standing.create(team: t18.name, match_played: 0, win: 0, lose: 0, draw: 0, gf: 0, ga: 0, gd: 0, game_session_id: s2.id)
Standing.create(team: t19.name, match_played: 0, win: 0, lose: 0, draw: 0, gf: 0, ga: 0, gd: 0, game_session_id: s2.id)
Standing.create(team: t20.name, match_played: 0, win: 0, lose: 0, draw: 0, gf: 0, ga: 0, gd: 0, game_session_id: s2.id)

puts "DB seed successfully"