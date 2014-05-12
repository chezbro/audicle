class MakeTopRecorderDefaultToFalse1 < ActiveRecord::Migration
  def change
    add_column :recordings, :top_recorder, :boolean, default: false
  end
end
