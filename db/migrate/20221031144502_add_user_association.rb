class AddUserAssociation < ActiveRecord::Migration[6.1]
  def change
    add_reference :songs, :user, null: false, foreign_key: true
    add_reference :projects, :user, null: false, foreign_key: true
  end
end
