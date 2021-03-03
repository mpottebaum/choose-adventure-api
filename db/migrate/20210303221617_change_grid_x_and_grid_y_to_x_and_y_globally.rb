class ChangeGridXAndGridYToXAndYGlobally < ActiveRecord::Migration[6.0]
  def change
    remove_column :story_nodes, :grid_x, :integer
    add_column :story_nodes, :x, :integer
    remove_column :story_nodes, :grid_y, :integer
    add_column :story_nodes, :y, :integer
    remove_column :choices, :grid_x, :integer
    add_column :choices, :x, :integer
    remove_column :choices, :grid_y, :integer
    add_column :choices, :y, :integer
  end
end
