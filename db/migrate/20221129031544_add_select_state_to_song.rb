class AddSelectStateToSong < ActiveRecord::Migration[6.1]
  def change
    add_column :songs, :selectstate_1, :boolean, default: :false
    add_column :songs, :selectstate_2, :boolean, default: :false
  end
end
