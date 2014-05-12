class FollowsProvidersController < ApplicationController

  def create
    @provider = Provider.find(params[:provider_id])
    @user = current_user
    @user.follow(@provider)
    respond_to do |format|
      format.js {render :action=>"create.js"}
      end
  end

  def destroy
    @provider = Provider.find(params[:provider_id])
    @user = current_user
    @user.stop_following(@provider)
    respond_to do |format|
      format.js {render :action=>"destroy.js"}
    end

  end

end
