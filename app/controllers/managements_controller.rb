class ManagementsController < ApplicationController
  before_action :set_management, only: [:show, :edit, :update, :destroy]

  # GET /managements
  def index
    @managements = Management.all
  end

  # GET /managements/1
  def show
  end

  # GET /managements/new
  def new
    @management = Management.new
  end

  # GET /managements/1/edit
  def edit
  end

  # POST /managements
  def create
    @management = Management.new(management_params)

    if @management.save
      redirect_to @management, notice: 'Management was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /managements/1
  def update
    if @management.update(management_params)
      redirect_to @management, notice: 'Management was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /managements/1
  def destroy
    @management.destroy
    redirect_to managements_url, notice: 'Management was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_management
      @management = Management.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def management_params
      params.require(:management).permit(:team_id, :player_id, :game_session_id)
    end
end
