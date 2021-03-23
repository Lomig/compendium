# frozen_string_literal: true

class CampaignPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(game_master: @user)
    end
  end

  def show?
    @record.game_master == @user
  end
end
