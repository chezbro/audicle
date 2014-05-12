class AddRecordingIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :recording_id, :integer
  end
end
