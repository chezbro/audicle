class AddForeignIds < ActiveRecord::Migration
  def change
    add_column :recordings, :topic_id, :integer
    add_column :recordings, :provider_id, :integer
  end
end
