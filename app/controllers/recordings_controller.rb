class RecordingsController < ApplicationController
  include AWS::S3
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

end
