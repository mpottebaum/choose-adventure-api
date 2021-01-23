class RemoveDecisionFromStoryNode < ActiveRecord::Migration[6.0]
  def change
    remove_column :story_nodes, :decision, :boolean
  end
end
