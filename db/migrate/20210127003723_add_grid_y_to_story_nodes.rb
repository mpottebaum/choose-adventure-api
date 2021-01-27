class AddGridYToStoryNodes < ActiveRecord::Migration[6.0]
  def change
    add_column :story_nodes, :grid_y, :integer
  end
end
