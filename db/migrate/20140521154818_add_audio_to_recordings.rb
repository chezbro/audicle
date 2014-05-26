class AddAudioToRecordings < ActiveRecord::Migration
  def change
    add_column :recordings, :audio, :string
  end
end
