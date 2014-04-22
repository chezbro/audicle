class Topic < ActiveRecord::Base
 has_many :recordings, dependent: :destroy
 has_many :providers, through: :recordings
end
