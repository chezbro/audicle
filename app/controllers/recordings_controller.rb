class RecordingsController < ApplicationController
  include AWS::S3
  before_filter :get_all_topics
  before_filter :get_all_providers

  def new
    @recording = Recording.new
  end
  def create
    @recording = Recording.create(recording_params)
    redirect_to :authenticated_root
    # respond_to do |format|
    #   format.html {redirect_to :authenticated_root}
    #   format.json {render action: 'new'}
    # end
  end
  def index
    @recordings = Recording.all
    @amazon_recordings = AWS::S3::Bucket.find('audicle').objects
  end
  def show
    @recording = Recording.find(params[:id])
    @recording_article = @recording.article
    @amazon_recordings = AWS::S3::Bucket.find('audicle').objects
  end
  def upload
    begin
        AWS::S3::S3Object.store(sanitize_filename(params[:mp3file].original_filename), params[:mp3file].read, 'audicle', :access => :public_read)
        redirect_to :authenticated_root
    rescue
        render :text => "Couldn't complete the upload"
    end
  end

  def delete
    if (params[:recording])
      AWS::S3::S3Object.find(params[:recording], "audicle").delete
      redirect_to :authenticated_root
    else
      render :text => "No Audicle was found to delete!"
    end
  end

  private

  def sanitize_filename(file_name)
      just_filename = File.basename(file_name)
      just_filename.sub(/[^\w\.\-]/,'_')
  end
  def recording_params
    params.require(:recording).permit(:topic_id, :description, :content, :provider_id,:url, :user_id, :article_id, :image)
  end
  def get_all_topics
    @topics = Topic.all
  end
  def get_all_providers
    @providers = Provider.all
  end

end
