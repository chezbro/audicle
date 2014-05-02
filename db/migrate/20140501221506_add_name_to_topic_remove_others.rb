class AddNameToTopicRemoveOthers < ActiveRecord::Migration
  def change
    add_column :topics, :name, :string
    remove_column :topics, :business
    remove_column :topics, :entertainment
    remove_column :topics, :news
    remove_column :topics, :lifestyle
    remove_column :topics, :sports
    remove_column :topics, :technology
    remove_column :topics, :world
  end
end
