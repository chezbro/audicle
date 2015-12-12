class DashboardsController < ApplicationController

  def index
    if user_signed_in?
      # @recordings  = current_user.recordings.build
      @user = current_user
      @recordings = Recording.all
    end
  end

end
