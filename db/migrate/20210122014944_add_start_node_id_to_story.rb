class AddStartNodeIdToStory < ActiveRecord::Migration[6.0]
  def change
    add_column :stories, :start_node_id, :integer
  end
end
