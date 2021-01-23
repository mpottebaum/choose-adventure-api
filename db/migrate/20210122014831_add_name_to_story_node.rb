class AddNameToStoryNode < ActiveRecord::Migration[6.0]
  def change
    add_column :story_nodes, :name, :string
  end
end
