class RemoveGridDimensionsFromStories < ActiveRecord::Migration[6.0]
  def change
    remove_column :stories, :grid_width, :integer
    remove_column :stories, :grid_height, :integer
  end
end
