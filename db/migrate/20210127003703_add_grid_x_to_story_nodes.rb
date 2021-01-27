class AddGridXToStoryNodes < ActiveRecord::Migration[6.0]
  def change
    add_column :story_nodes, :grid_x, :integer
  end
end
