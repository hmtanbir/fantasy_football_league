class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  def index
    @games = Game.all
  end

  # GET /games/1
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      set_standing_table_data
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      redirect_to @game, notice: 'Game was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
    redirect_to games_url, notice: 'Game was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      params.require(:game).permit(:match_number, :home_team, :away_team,
                                   :home_team_goal, :away_team_goal, :game_date, :game_session_id)
    end

   def set_standing_table_data
     home_team_goal = params[:game][:home_team_goal].to_i
     away_team_goal = params[:game][:away_team_goal].to_i
     update_home_team(home_team_goal, away_team_goal)
     update_away_team(home_team_goal, away_team_goal)
   end

  def update_home_team(home_team_goal,away_team_goal)
    home_team_object = Standing.check_object(params[:game][:home_team], params[:game][:game_session_id]).try(:first)

    if home_team_object.present?
      home_team_object.update(
        match_played: home_team_object.match_played + 1,
        win: (home_team_object.win + (home_team_goal > away_team_goal ? 1 : 0)),
        lose: (home_team_object.lose + (home_team_goal < away_team_goal ? 1 : 0)),
        draw: (home_team_object.draw + (home_team_goal == away_team_goal ? 1 : 0)),
        gf: home_team_object.gf + home_team_goal,
        ga: home_team_object.ga + away_team_goal,
        gd: home_team_object.gf + home_team_goal - (home_team_object.ga + away_team_goal)
      )
    else
      standing_home_team = Standing.new(
        team: params[:game][:home_team],
        win: (home_team_goal > away_team_goal ? 1 : 0),
        lose: (home_team_goal < away_team_goal ? 1 : 0),
        draw: (home_team_goal == away_team_goal ? 1 : 0),
        gf: home_team_goal,
        ga: away_team_goal,
        gd: (home_team_goal - away_team_goal),
        game_session_id: params[:game][:game_session_id]
      )
      standing_home_team.save
    end
  end

  def update_away_team(home_team_goal,away_team_goal)
    away_team_object = Standing.check_object(params[:game][:away_team], params[:game][:game_session_id]).try(:first)

    if away_team_object.present?
      away_team_object.update(
        match_played: away_team_object.match_played + 1,
        win: (away_team_object.win + (away_team_goal > home_team_goal ? 1 : 0)),
        lose: (away_team_object.lose + (away_team_goal < home_team_goal ? 1 : 0)),
        draw: (away_team_object.draw + (home_team_goal == away_team_goal ? 1 : 0)),
        gf: away_team_object.gf + away_team_goal,
        ga: away_team_object.ga + home_team_goal,
        gd: away_team_object.gf + away_team_goal - (away_team_object.ga + home_team_goal)
      )
    else
      standing_away_team = Standing.new(
        team: params[:game][:away_team],
        win: (away_team_goal > home_team_goal ? 1 : 0),
        lose: (away_team_goal < home_team_goal ? 1 : 0),
        draw: (home_team_goal == away_team_goal ? 1 : 0),
        gf: away_team_goal,
        ga: home_team_goal,
        game_session_id: params[:game][:game_session_id]
      )
      standing_away_team.save
    end
  end
end
