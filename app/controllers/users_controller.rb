# frozen_string_literal: true

# Actions on current_user
class UsersController < ApplicationController
  before_action :skip_authorization

  def logout
    sign_out current_user
    redirect_to root_path
  end

  def avatar_update
    current_user.update(avatar: params[:user][:avatar])

    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.turbo_stream do
        stream_component(action: :replace, id: "user_#{current_user.id}", component: PageHeader, model: current_user)
      end
    end
  end
end
