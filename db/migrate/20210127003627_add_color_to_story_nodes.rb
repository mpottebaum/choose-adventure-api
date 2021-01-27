class AddColorToStoryNodes < ActiveRecord::Migration[6.0]
  def change
    add_column :story_nodes, :color, :string
  end
end
