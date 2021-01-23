class AddEndToStoryNodes < ActiveRecord::Migration[6.0]
  def change
    add_column :story_nodes, :end, :boolean, default: false
  end
end
