class Recording < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  belongs_to :topic
  belongs_to :provider
  # accepts_nested_attributes_for :topic
  # accepts_nested_attributes_for :provider
end
