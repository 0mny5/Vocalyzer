class AddProjectAssociation < ActiveRecord::Migration[6.1]
  def change
    add_reference :songs, :project, type: :string, index: true
  end
end
