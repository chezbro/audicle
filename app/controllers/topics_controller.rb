class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @business = Topic.where(name: 'Business').first
  end
  def show
    @business = Topic.for_correct_topic("Business")
    @topic = Topic.find(params[:id])
  end
end


