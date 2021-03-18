class HomeController < ApplicationController
  before_action :permit_params, only: :standings
  before_action :required_objects, only: :standings

  def index
  end

  def standings
    @query = Standing.order_desc.ransack(params[:q])
    @standings = @query.result(distinct: true)
  end

  private

  def permit_params
    @params = params.permit(q: :game_session_id_eq)
  end

  def required_objects
    @seasons = GameSession.distinct.pluck(:period, :id).compact.sort
  end
end
