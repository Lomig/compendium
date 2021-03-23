# frozen_string_literal: true

# GamesController
class GamesController < ApplicationController
  def index
    @games = policy_scope(Game)
  end

  def show
    @game = Game.find(params[:id])
    authorize @game

    @campaigns = policy_scope(@game.campaigns)
  end
end
