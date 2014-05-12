class Recording < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  belongs_to :topic
  belongs_to :provider
  validates :user_id, presence: true
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end
