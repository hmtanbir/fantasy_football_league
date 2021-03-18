require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:season) { FactoryBot.create :game_session }
  let(:game) { FactoryBot.create :game,
                                 home_team: 'Manchester City',
                                 away_team: 'Manchester United',
                                 game_session_id: season.id }

  let(:standing_home) { FactoryBot.create :standing,
                                          team: 'Manchester City',
                                          win: 1,
                                          lose: 0,
                                          draw: 0,
                                          gf: 2,
                                          ga: 1,
                                          gd: 1,
                                          game_session_id: season.id }

  let(:standing_away) { FactoryBot.create :standing,
                                          team:'Manchester United',
                                          win: 0,
                                          lose: 1,
                                          draw: 0,
                                          gf: 1,
                                          ga: 2,
                                          gd: -1,
                                          game_session_id: season.id }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #standings" do
    before do
      game
      standing_home
      standing_away
    end

    it "returns http success" do
      get :standings, params: { q: season.id }
      expect(response).to have_http_status(:success)
    end

    it "returns season wise team standings data" do
      get :standings, params: { q: season.id }
      expect(assigns(:standings)).to eq([standing_home, standing_away])
    end
  end
end
