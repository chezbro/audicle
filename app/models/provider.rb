class Provider < ActiveRecord::Base
  has_many :recordings, dependent: :destroy
  has_many :topics, through: :recordings
  has_many :articles
end
