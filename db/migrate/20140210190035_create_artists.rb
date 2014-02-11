class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name, null: false
      t.string :genre
      t.text :photo_url, null: false
    end
  end
end
