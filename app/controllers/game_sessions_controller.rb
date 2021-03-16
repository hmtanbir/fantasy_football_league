class GameSessionsController < ApplicationController
  before_action :set_game_session, only: [:show, :edit, :update, :destroy]

  # GET /game_sessions
  def index
    @game_sessions = GameSession.all
  end

  # GET /game_sessions/1
  def show
  end

  # GET /game_sessions/new
  def new
    @game_session = GameSession.new
  end

  # GET /game_sessions/1/edit
  def edit
  end

  # POST /game_sessions
  def create
    @game_session = GameSession.new(game_session_params)

    if @game_session.save
      redirect_to @game_session, notice: 'Game session was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /game_sessions/1
  def update
    if @game_session.update(game_session_params)
      redirect_to @game_session, notice: 'Game session was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /game_sessions/1
  def destroy
    @game_session.destroy
    redirect_to game_sessions_url, notice: 'Game session was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_session
      @game_session = GameSession.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_session_params
      params.require(:game_session).permit(:period)
    end
end
