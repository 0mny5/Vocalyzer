class AddSongLabelToSong < ActiveRecord::Migration[6.1]
  def change
    add_column :songs, :song_label, :string, null: false, uniqueness: true
  end
end
