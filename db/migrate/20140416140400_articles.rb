class Articles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :content
      t.string :provider
      t.string :author
      t.string :title
      t.string :length
      t.string :description
      t.datetime :article_date
      t.string :image
      t.string :url
    end
  end
end
