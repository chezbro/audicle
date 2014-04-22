class Recording < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  belongs_to :topic
  belongs_to :provider
end
