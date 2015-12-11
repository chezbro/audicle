class DashboardsController < ApplicationController

  def index
    if user_signed_in?
      # @recordings  = current_user.recordings.build
      @user = current_user
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

end
