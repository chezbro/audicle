class Providers < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :description
      t.string :category
      t.integer :rank
      t.integer :amount_of_recordings
      t.string :url
      t.string :image_url
    end
  end
end
