class Recording < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  belongs_to :provider
  validates :user_id, presence: true
  mount_uploader :audio, AudioUploader

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end

  def audio_name
    File.basename(audio.path || audio.filename) if audio
  end

end
