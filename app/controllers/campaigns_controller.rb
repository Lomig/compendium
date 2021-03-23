class CampaignsController < ApplicationController
  def show
    @campaign = Campaign.find(params[:id])
    authorize @campaign
  end
end
