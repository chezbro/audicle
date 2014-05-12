class RecordingsController < ApplicationController
  include AWS::S3
  before_filter :get_all_topics
  before_filter :get_all_providers


  def new
    @recording = Recording.new
  end
  def create
    fileUp = params[:recording]
    orig_name = fileUp[:audio_file].original_filename
    AWS::S3::S3Object.store(orig_name, fileUp[:audio_file].read, 'audicle', :access => :public_read)
    url = AWS::S3::S3Object.url_for(orig_name, "audicle", authenticated: false)
    @recording = Recording.new(recording_params)
    @recording.audio_file = orig_name
    @recording.top_recorder = false
    @recording.user_id = current_user.id
    # @recording.top_recorder = false
    # @recording.user_id = current_user.id
    # if @recording.url == Recording.where(url:@recording.url).each {|r| r.url}
    if Recording.where(url:fileUp[:url]).where(top_recorder:true).first
      redirect_to :authenticated_root, notice: "Sorry, an Audicle has already been recorded for this article."
    else
      @recording.save!
      redirect_to :authenticated_root, notice: "Audicle successfully saved!"
    end
    # if Recording.where(url:fileUp[:url])
    # if Recording.where(fileUp)
    # respond_to do |format|
    #   format.html {redirect_to :authenticated_root}
    #   format.json {render action: 'new'}
    # end

  end
  def index
    @recordings = Recording.all

    # @amazon_recordings = AWS::S3::Bucket.find('audicle')
    # @amazon_recordings = AWS::S3::Bucket.find('audicle')[params[@recording.audio_file]]
  end
  def show
    @users = User.all
    @recordings = Recording.all
    @recording = Recording.find(params[:id])
    @same_recording_url = Recording.where(url:@recording.url).first
    @top_recorder = Recording.where(url:@recording.url).where(top_recorder:true).first

    @same_recording_users = Recording.where(url:@recording.url)

    # @recording_article = @recording.article
    @amazon_recording = AWS::S3::Bucket.find('audicle')[@recording.title + '.mp3']
  end
  # def upload
  #   begin
  #       AWS::S3::S3Object.store(sanitize_filename(params[:audio_file].original_filename), params[:mp3file].read, 'audicle', :access => :public_read)
  #       flash[:success] = "Audicle uploaded successfully!"
  #       redirect_to :action => 'new'
  #   rescue
  #       render :text => "Couldn't complete the upload"
  #   end
  # end

  def destroy
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
    params.require(:recording).permit(:topic_id, :description, :content, :provider_id, :url, :user_id, :article_id, :image, :mp3file, :audio_file, :title, :author, :top_recorder)
  end
  def get_all_topics
    @topics = Topic.all
  end
  def get_all_providers
    @providers = Provider.all
  end



end
