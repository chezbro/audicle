class RemoveUneededTopics < ActiveRecord::Migration
  def change
    remove_column :topics, :business, :string
    remove_column :topics, :entertainment, :string
    remove_column :topics, :news, :string
    remove_column :topics, :lifestyle, :string
    remove_column :topics, :sports, :string
    remove_column :topics, :technology, :string
    remove_column :topics, :world, :string
  end
end
