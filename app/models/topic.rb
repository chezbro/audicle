class Topic < ActiveRecord::Base
 has_many :recordings, dependent: :destroy
 has_many :providers, through: :recordings
 has_many :articles
 acts_as_followable

 # Scopes
 scope :for_correct_topic, ->(name) {where(name: name).first}
# scope :for_active_contest, ->(user_id, contest_id) {where(user_id: user_id).where(contest_id: contest_id).where(active: true)}




end
