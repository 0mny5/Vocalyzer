class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects, id: false do |t|
      t.string :title
      t.string :uuid, primary_key: true

      t.timestamps

      t.index :uuid
    end
  end
end
