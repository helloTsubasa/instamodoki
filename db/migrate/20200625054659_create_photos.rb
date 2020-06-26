class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :image, null: false
      t.references :tweet, foreign_key: true, null: false
      t.timestamps
    end
  end
end
