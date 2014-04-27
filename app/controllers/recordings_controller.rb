class RecordingsController < ApplicationController
  def index
    @recordings = Recording.all
  end
  def show
    @recording = Recording.find(params[:id])
    @recording_article = @recording.article
  end
end
