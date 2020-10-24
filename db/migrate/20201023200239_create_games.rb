class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :release_date
      t.text :description
      t.text :genre, array: true, default: []
      t.string :image
      t.integer :score
      t.string :developer
      t.text :publisher, array: true, default: []
      t.string :rating
      t.text :also_available, array: true, default: []

      t.timestamps
    end
  end
end
