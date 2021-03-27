# frozen_string_literal: true

# Actions on current_user
class UsersController < ApplicationController
  before_action :skip_authorization

  def logout
    sign_out current_user
    redirect_to root_path
  end

  def update
    current_user.update(user_params)

    respond_to do |format|
      format.any(:html, :json, :js) { head :no_content }
      format.turbo_stream do
        stream.add(action: :replace, id: current_user, component: PageHeader, model: current_user)
              .render
      end
    end
  end

  def avatar_update
    current_user.update(avatar: params[:user][:avatar])

    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.turbo_stream do
        stream.add(action: :replace, id: current_user, component: PageHeader, model: current_user)
              .add(action: :replace, id: 'user_icon', component: Navbar::UserMenu, user: current_user)
              .render
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
