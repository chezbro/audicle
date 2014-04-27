class ChangeTopicsToBooleans < ActiveRecord::Migration
  def change
    add_column :topics, :business, :boolean, :default => false
    add_column :topics, :entertainment, :boolean, :default => false
    add_column :topics, :news, :boolean, :default => false
    add_column :topics, :lifestyle, :boolean, :default => false
    add_column :topics, :sports, :boolean, :default => false
    add_column :topics, :technology, :boolean, :default => false
    add_column :topics, :world, :boolean, :default => false
  end
end
