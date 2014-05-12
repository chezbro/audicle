class FollowsTopicsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @user = current_user
    @user.follow(@topic)
    respond_to do |format|
      format.js {render :action=> "create.js"}
      end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @user = current_user
    @user.stop_following(@topic)
    respond_to do |format|
      format.js {render :action=> "destroy.js"}
    end
  end

end
