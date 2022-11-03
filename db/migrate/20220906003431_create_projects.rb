class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :uuid

      t.timestamps

      t.index :uuid
    end
  end
end
