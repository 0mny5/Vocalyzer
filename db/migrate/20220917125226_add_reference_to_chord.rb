class AddReferenceToChord < ActiveRecord::Migration[6.1]
  def change
    add_reference :chords, :song, null: false, foreign_key: true
  end
end
