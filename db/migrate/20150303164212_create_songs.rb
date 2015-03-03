class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :author
      t.float :time
      t.text :lyric_lineID
      t.string :tune

      t.timestamps null: false
    end
  end
end
