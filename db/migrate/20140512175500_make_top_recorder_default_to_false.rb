class MakeTopRecorderDefaultToFalse < ActiveRecord::Migration
  def change
    remove_column :recordings, :top_recorder, :boolean
  end
end
