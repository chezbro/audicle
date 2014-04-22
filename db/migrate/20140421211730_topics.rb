class Topics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :business
      t.string :entertainment
      t.string :lifestyle
      t.string :news
      t.string :sports
      t.string :technology
      t.string :world
    end
  end
end
