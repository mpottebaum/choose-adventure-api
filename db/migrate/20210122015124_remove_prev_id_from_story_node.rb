class RemovePrevIdFromStoryNode < ActiveRecord::Migration[6.0]
  def change
    remove_column :story_nodes, :prev_id, :integer
  end
end
