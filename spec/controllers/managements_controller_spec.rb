require 'rails_helper'

RSpec.describe ManagementsController, type: :controller do

  let(:player) { FactoryBot.create :player }
  let(:team) { FactoryBot.create :team }
  let(:game_session) { FactoryBot.create :game_session }
  let(:management) { FactoryBot.create :management }

  let(:valid_attributes) do {
    player_id: player.id,
    team_id: team.id,
    game_session_id: game_session.id
  }
  end

  let(:invalid_attributes) do {
    player_id: nil,
    team_id: nil,
    game_session_id: nil
  }
  end

  describe "GET #index" do
    it "returns a success response" do
      Management.create! valid_attributes
      get :index
      expect(response).to be_successful
    end

    it 'assigns all management as @management' do
      management = Management.create! valid_attributes
      get :index
      expect(assigns(:managements)).to eq([management])
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      management = Management.create! valid_attributes
      get :show, params: {id: management.to_param}
      expect(response).to be_successful
    end

    it 'assigns the requested management as @management' do
      management = Management.create! valid_attributes
      get :show, params: { id: management.to_param }
      expect(assigns(:management)).to eq(management)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { management_id: management.to_param }
      expect(response).to be_successful
    end

    it 'assigns a new management as @management' do
      get :new, params: { management_id: management.to_param }
      expect(assigns(:management)).to be_a_new(Management)
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      management = Management.create! valid_attributes
      get :edit, params: { id: management.to_param }
      expect(response).to be_successful
    end

    it 'assigns the requested management as @management' do
      submission = Management.create! valid_attributes
      get :edit, params: { id: management.to_param }
      expect(assigns(:management)).to eq(management)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new management" do
        expect {
          post :create, params: { management: valid_attributes }
        }.to change(Management, :count).by(1)
      end

      it 'assigns a newly created management as @management' do
        post :create, params: { management: valid_attributes }
        expect(assigns(:management)).to be_a(Management)
        expect(assigns(:management)).to be_persisted
      end

      it "redirects to the created management" do
        post :create, params: { management: valid_attributes }
        expect(response).to redirect_to(Management.last)
      end

      it 'shows a successful flash message' do
        post :create, params: { management: valid_attributes }
        expect(flash[:notice]).to match('Management was successfully created.')
      end
    end

    context "with invalid params" do
      it 'returns a success response' do
        post :create, params: { management: invalid_attributes }
        expect(response).to be_successful
      end

      it 'assigns a newly created but unsaved management as @management' do
        post :create, params: { management: invalid_attributes }
        expect(assigns(:management)).to be_a_new(Management)
      end

      it 're-renders the new template' do
        post :create, params: { management: invalid_attributes }
        expect(response).to render_template('new')
      end

      it 'does not show any flash message' do
        post :create, params: { management: invalid_attributes }
        expect(flash[:notice]).to match(nil)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        { team_id: team.id }
      end

      it "updates the requested management" do
        management = Management.create! valid_attributes
        put :update, params: { id: management.to_param, management: new_attributes }
        management.reload
        expect(flash[:notice]).to eq('Management was successfully updated.')
      end

      it 'assigns the requested management as @management' do
        submission = Management.create! valid_attributes
        put :update, params: { id: management.to_param, management: new_attributes }
        expect(assigns(:management)).to eq(management)
      end

      it "redirects to the management" do
        management = Management.create! valid_attributes
        put :update, params: { id: management.to_param, management: new_attributes }
        expect(response).to redirect_to(management)
      end
    end

    context "with invalid params" do
      it "returns a success response with edit template" do
        management = Management.create! valid_attributes
        put :update, params: { id: management.to_param, management: invalid_attributes }
        expect(response).to be_successful
      end

      it 'assigns the management as @management' do
        management = Management.create! valid_attributes
        put :update, params: { id: management.to_param, management: invalid_attributes }
        expect(assigns(:management)).to eq(management)
      end

      it 're-renders the edit template' do
        management = Management.create! valid_attributes
        put :update, params: { id: management.to_param, management: invalid_attributes }
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested management" do
      management = Management.create! valid_attributes
      expect {
        delete :destroy, params: { id: management.to_param }
      }.to change(Management, :count).by(-1)
    end

    it "redirects to the managements list" do
      management = Management.create! valid_attributes
      delete :destroy, params: { id: management.to_param }
      expect(response).to redirect_to(managements_url)
    end

    it 'shows a successful flash message' do
      management = Management.create! valid_attributes
      delete :destroy, params: { id: management.to_param }
      expect(flash[:notice]).to match('Management was successfully destroyed.')
    end
  end
end
