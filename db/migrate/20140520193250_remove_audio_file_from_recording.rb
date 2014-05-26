class RemoveAudioFileFromRecording < ActiveRecord::Migration
  def change
    remove_column :recordings, :audio_file
  end
end
