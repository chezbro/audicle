class Recordings < ActiveRecord::Migration
  def change
    create_table :recordings do |t|
      t.string :description
      t.text :content
      t.string :audio_file
      t.integer :length
      t.boolean :verified
      t.boolean :top_recorder
      t.string :provider
      t.string :image
      t.string :url
      t.integer :user_id
      t.integer :article_id
    end
  end
end
