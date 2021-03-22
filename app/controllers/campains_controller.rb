class CampainsController < ApplicationController
  def show
    @campain = Campain.find(params[:id])
    authorize @campain
  end
end
