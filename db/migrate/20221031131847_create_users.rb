class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :uid, unique: true
      t.string :name
      t.string :image
      t.integer :role, default: 0, null: false

      t.timestamps
    end
  end
end
