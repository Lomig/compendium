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
        stream = turbo_stream.replace "user_#{current_user.id}" do
          view_context.render(PageHeader::Component.new(model: current_user))
        end

        render turbo_stream: stream
      end
    end
  end
end
