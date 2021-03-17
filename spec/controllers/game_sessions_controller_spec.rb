require 'rails_helper'

RSpec.describe GameSessionsController, type: :controller do

  let(:game_session) { FactoryBot.create :game_session }

  let(:valid_attributes) do {
    period: '2020-21'
  }
  end

  let(:invalid_attributes) do {
    period: nil
  }
  end
  
  describe "GET #index" do
    it "returns a success response" do
      GameSession.create! valid_attributes
      get :index
      expect(response).to be_successful
    end

    it 'assigns all game_session as @game_session' do
      game_session = GameSession.create! valid_attributes
      get :index
      expect(assigns(:game_sessions)).to eq([game_session])
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      game_session = GameSession.create! valid_attributes
      get :show, params: {id: game_session.to_param}
      expect(response).to be_successful
    end

    it 'assigns the requested game_session as @game_session' do
      game_session = GameSession.create! valid_attributes
      get :show, params: { id: game_session.to_param }
      expect(assigns(:game_session)).to eq(game_session)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { game_session_id: game_session.to_param }
      expect(response).to be_successful
    end

    it 'assigns a new game_session as @game_session' do
      get :new, params: { game_session_id: game_session.to_param }
      expect(assigns(:game_session)).to be_a_new(GameSession)
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      game_session = GameSession.create! valid_attributes
      get :edit, params: { id: game_session.to_param }
      expect(response).to be_successful
    end

    it 'assigns the requested game_session as @game_session' do
      submission = GameSession.create! valid_attributes
      get :edit, params: { id: game_session.to_param }
      expect(assigns(:game_session)).to eq(game_session)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new GameSession" do
        expect {
          post :create, params: { game_session: valid_attributes }
        }.to change(GameSession, :count).by(1)
      end

      it 'assigns a newly created game_session as @game_session' do
        post :create, params: { game_session: valid_attributes }
        expect(assigns(:game_session)).to be_a(GameSession)
        expect(assigns(:game_session)).to be_persisted
      end

      it "redirects to the created game_session" do
        post :create, params: { game_session: valid_attributes }
        expect(response).to redirect_to(GameSession.last)
      end

      it 'shows a successful flash message' do
        post :create, params: { game_session: valid_attributes }
        expect(flash[:notice]).to match('Game session was successfully created.')
      end
    end

    context "with invalid params" do
      it 'returns a success response' do
        post :create, params: { game_session: invalid_attributes }
        expect(response).to be_successful
      end

      it 'assigns a newly created but unsaved game_session as @game_session' do
        post :create, params: { game_session: invalid_attributes }
        expect(assigns(:game_session)).to be_a_new(GameSession)
      end

      it 're-renders the new template' do
        post :create, params: { game_session: invalid_attributes }
        expect(response).to render_template('new')
      end

      it 'does not show any flash message' do
        post :create, params: { game_session: invalid_attributes }
        expect(flash[:notice]).to match(nil)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
      { period: '2021-22'}
      end

      it "updates the requested game_session" do
        game_session = GameSession.create! valid_attributes
        put :update, params: { id: game_session.to_param, game_session: new_attributes }
        game_session.reload
        expect(flash[:notice]).to eq('Game session was successfully updated.')
      end

      it 'assigns the requested game_session as @game_session' do
        submission = GameSession.create! valid_attributes
        put :update, params: { id: game_session.to_param, game_session: new_attributes }
        expect(assigns(:game_session)).to eq(game_session)
      end

      it "redirects to the game_session" do
        game_session = GameSession.create! valid_attributes
        put :update, params: { id: game_session.to_param, game_session: new_attributes }
        expect(response).to redirect_to(game_session)
      end
    end

    context "with invalid params" do
      it "returns a success response with edit template" do
        game_session = GameSession.create! valid_attributes
        put :update, params: { id: game_session.to_param, game_session: invalid_attributes }
        expect(response).to be_successful
      end

      it 'assigns the game_session as @game_session' do
        game_session = GameSession.create! valid_attributes
        put :update, params: { id: game_session.to_param, game_session: invalid_attributes }
        expect(assigns(:game_session)).to eq(game_session)
      end

      it 're-renders the edit template' do
        game_session = GameSession.create! valid_attributes
        put :update, params: { id: game_session.to_param, game_session: invalid_attributes }
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested game_session" do
      game_session = GameSession.create! valid_attributes
      expect {
        delete :destroy, params: {id: game_session.to_param}
      }.to change(GameSession, :count).by(-1)
    end

    it "redirects to the game_sessions list" do
      game_session = GameSession.create! valid_attributes
      delete :destroy, params: { id: game_session.to_param }
      expect(response).to redirect_to(game_sessions_url)
    end

    it 'shows a successful flash message' do
      game_session = GameSession.create! valid_attributes
      delete :destroy, params: { id: game_session.to_param }
      expect(flash[:notice]).to match('Game session was successfully destroyed.')
    end
  end
end
