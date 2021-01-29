class AddGridHeightToStories < ActiveRecord::Migration[6.0]
  def change
    add_column :stories, :grid_height, :integer, default: 100
  end
end
