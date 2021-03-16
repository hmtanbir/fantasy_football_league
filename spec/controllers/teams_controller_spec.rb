require 'rails_helper'

RSpec.describe TeamsController, type: :controller do

  let(:team) { FactoryBot.create :team }

  let(:valid_attributes) do {
    name: 'Man City',
    city: 'Manchester City' 
  }
  end

  let(:invalid_attributes) do {
    name: nil,
    city: nil
  }
  end

  describe "GET #index" do
    it "returns a success response" do
      Team.create! valid_attributes
      get :index
      expect(response).to be_successful
    end

    it 'assigns all team as @team' do
      team = Team.create! valid_attributes
      get :index
      expect(assigns(:teams)).to eq([team])
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      team = Team.create! valid_attributes
      get :show, params: { id: team.to_param }
      expect(response).to be_successful
    end

    it 'assigns the requested team as @team' do
      team = Team.create! valid_attributes
      get :show, params: { id: team.to_param }
      expect(assigns(:team)).to eq(team)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { team_id: team.to_param }
      expect(response).to be_successful
    end

    it 'assigns a new team as @team' do
      get :new, params: { team_id: team.to_param }
      expect(assigns(:team)).to be_a_new(Team)
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      team = Team.create! valid_attributes
      get :edit, params: { id: team.to_param }
      expect(response).to be_successful
    end

    it 'assigns the requested team as @team' do
      submission = Team.create! valid_attributes
      get :edit, params: { id: team.to_param }
      expect(assigns(:team)).to eq(team)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Team" do
        expect {
          post :create, params: { team: valid_attributes }
        }.to change(Team, :count).by(1)
      end

      it 'assigns a newly created team as @team' do
        post :create, params: { team: valid_attributes }
        expect(assigns(:team)).to be_a(Team)
        expect(assigns(:team)).to be_persisted
      end

      it "redirects to the created team" do
        post :create, params: { team: valid_attributes }
        expect(response).to redirect_to(Team.last)
      end

      it 'shows a successful flash message' do
        post :create, params: { team: valid_attributes }
        expect(flash[:notice]).to match('Team was successfully created.')
      end
    end

    context "with invalid params" do
      it 'returns a success response' do
        post :create, params: { team: invalid_attributes }
        expect(response).to be_successful
      end

      it 'assigns a newly created but unsaved team as @team' do
        post :create, params: { team: invalid_attributes }
        expect(assigns(:team)).to be_a_new(Team)
      end

      it 're-renders the new template' do
        post :create, params: { team: invalid_attributes }
        expect(response).to render_template('new')
      end

      it 'does not show any flash message' do
        post :create, params: { team: invalid_attributes }
        expect(flash[:notice]).to match(nil)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        { name: 'Man U'}
      end

      it "updates the requested team" do
        team = Team.create! valid_attributes
        put :update, params: { id: team.to_param, team: new_attributes }
        team.reload
        expect(flash[:notice]).to eq('Team was successfully updated.')
      end

      it 'assigns the requested team as @team' do
        submission = Team.create! valid_attributes
        put :update, params: { id: team.to_param, team: valid_attributes }
        expect(assigns(:team)).to eq(team)
      end

      it "redirects to the team" do
        team = Team.create! valid_attributes
        put :update, params: {id: team.to_param, team: valid_attributes}
        expect(response).to redirect_to(team)
      end
    end

    context "with invalid params" do
      it "returns a success response with edit template" do
        team = Team.create! valid_attributes
        put :update, params: { id: team.to_param, team: invalid_attributes }
        expect(response).to be_successful
      end

      it 'assigns the team as @team' do
        team = Team.create! valid_attributes
        put :update, params: { id: team.to_param, team: invalid_attributes }
        expect(assigns(:team)).to eq(team)
      end

      it 're-renders the edit template' do
        team = Team.create! valid_attributes
        put :update, params: { id: team.to_param, team: invalid_attributes }
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested team" do
      team = Team.create! valid_attributes
      expect {
        delete :destroy, params: {id: team.to_param}
      }.to change(Team, :count).by(-1)
    end

    it "redirects to the teams list" do
      team = Team.create! valid_attributes
      delete :destroy, params: { id: team.to_param }
      expect(response).to redirect_to(teams_url)
    end

    it 'shows a successful flash message' do
      team = Team.create! valid_attributes
      delete :destroy, params: { id: team.to_param }
      expect(flash[:notice]).to match('Team was successfully destroyed.')
    end
  end
end
