class ChangeNextIdToNextNodeIdGlobally < ActiveRecord::Migration[6.0]
  def change
    remove_column :story_nodes, :next_id, :integer
    add_column :story_nodes, :next_node_id, :integer
    remove_column :choices, :next_id, :integer
    add_column :choices, :next_node_id, :integer
  end
end
