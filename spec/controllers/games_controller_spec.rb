require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  let(:season) { FactoryBot.create :game_session }
  let(:game) { FactoryBot.create :game }

  let(:valid_attributes) do {
    match_number: 1,
    home_team: 'Manchester City',
    away_team: 'Manchester United',
    home_team_goal: 4,
    away_team_goal: 3,
    game_date: Date.new,
    game_session_id: season.id
  }
  end

  let(:invalid_attributes) do {
    match_number: nil,
    home_game: nil,
    away_game: nil,
    home_game_goal: nil,
    away_game_goal: nil,
    game_date: nil,
    game_session_id: nil
  }
  end

  describe "GET #index" do
    it "returns a success response" do
      Game.create! valid_attributes
      get :index
      expect(response).to be_successful
    end

    it 'assigns all game as @game' do
      game = Game.create! valid_attributes
      get :index
      expect(assigns(:games)).to eq([game])
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      game = Game.create! valid_attributes
      get :show, params: { id: game.to_param }
      expect(response).to be_successful
    end

    it 'assigns the requested game as @game' do
      game = Game.create! valid_attributes
      get :show, params: { id: game.to_param }
      expect(assigns(:game)).to eq(game)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { game_id: game.to_param }
      expect(response).to be_successful
    end

    it 'assigns a new game as @game' do
      get :new, params: { game_id: game.to_param }
      expect(assigns(:game)).to be_a_new(Game)
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      game = Game.create! valid_attributes
      get :edit, params: { id: game.to_param }
      expect(response).to be_successful
    end

    it 'assigns the requested game as @game' do
      game = Game.create! valid_attributes
      get :edit, params: { id: game.to_param }
      expect(assigns(:game)).to eq(game)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new game" do
        expect {
          post :create, params: { game: valid_attributes }
        }.to change(Game, :count).by(1)
      end

      it 'assigns a newly created game as @game' do
        post :create, params: { game: valid_attributes }
        expect(assigns(:game)).to be_a(Game)
        expect(assigns(:game)).to be_persisted
      end

      it "redirects to the created game" do
        post :create, params: { game: valid_attributes }
        expect(response).to redirect_to(Game.last)
      end

      it 'shows a successful flash message' do
        post :create, params: { game: valid_attributes }
        expect(flash[:notice]).to match('Game was successfully created.')
      end
    end

    context "with invalid params" do
      it 'returns a success response' do
        post :create, params: { game: invalid_attributes }
        expect(response).to be_successful
      end

      it 'assigns a newly created but unsaved game as @game' do
        post :create, params: { game: invalid_attributes }
        expect(assigns(:game)).to be_a_new(Game)
      end

      it 're-renders the new template' do
        post :create, params: { game: invalid_attributes }
        expect(response).to render_template('new')
      end

      it 'does not show any flash message' do
        post :create, params: { game: invalid_attributes }
        expect(flash[:notice]).to match(nil)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        { home_team: 'Arsenal'}
      end

      it "updates the requested game" do
        game = Game.create! valid_attributes
        put :update, params: { id: game.to_param, game: new_attributes }
        game.reload
        expect(flash[:notice]).to eq('Game was successfully updated.')
      end

      it 'assigns the requested game as @game' do
        game = Game.create! valid_attributes
        put :update, params: { id: game.to_param, game: new_attributes }
        expect(assigns(:game)).to eq(game)
      end

      it "redirects to the game" do
        game = Game.create! valid_attributes
        put :update, params: { id: game.to_param, game: new_attributes }
        expect(response).to redirect_to(game)
      end
    end

    context "with invalid params" do
      it "returns a success response with edit template" do
        game = Game.create! valid_attributes
        put :update, params: { id: game.to_param, game: invalid_attributes }
        expect(response).to be_successful
      end

      it 'assigns the game as @game' do
        game = Game.create! valid_attributes
        put :update, params: { id: game.to_param, game: invalid_attributes }
        expect(assigns(:game)).to eq(game)
      end

      it 're-renders the edit template' do
        game = Game.create! valid_attributes
        put :update, params: { id: game.to_param, game: invalid_attributes }
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested game" do
      game = Game.create! valid_attributes
      expect {
        delete :destroy, params: { id: game.to_param }
      }.to change(Game, :count).by(-1)
    end

    it "redirects to the games list" do
      game = Game.create! valid_attributes
      delete :destroy, params: { id: game.to_param }
      expect(response).to redirect_to(games_url)
    end

    it 'shows a successful flash message' do
      game = Game.create! valid_attributes
      delete :destroy, params: { id: game.to_param }
      expect(flash[:notice]).to match('Game was successfully destroyed.')
    end
  end
end
