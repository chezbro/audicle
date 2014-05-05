class AddAuthorAndTitleToRecordings < ActiveRecord::Migration
  def change
    add_column :recordings, :title, :string
    add_column :recordings, :author, :string
  end
end
