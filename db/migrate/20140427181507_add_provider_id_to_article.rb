class AddProviderIdToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :topic_id, :integer
    add_column :articles, :provider_id, :integer
  end
end
