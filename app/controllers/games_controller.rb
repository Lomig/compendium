# frozen_string_literal: true

class GamesController < ApplicationController
  def index
    @games = policy_scope(Game)
  end

  def show
    @game = Game.find(params[:id])
    authorize @game
  end
end
