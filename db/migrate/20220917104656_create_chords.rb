class CreateChords < ActiveRecord::Migration[6.1]
  def change
    create_table :chords do |t|
      t.integer :index
      t.integer :start
      t.integer :duration
      t.string :name

      t.timestamps
    end
  end
end
