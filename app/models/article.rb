class Article < ActiveRecord::Base
  has_many :recordings, dependent: :destroy
  has_many :users, through: :recordings
  belongs_to :topic
end
