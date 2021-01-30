class ChangeGridSizeDefaultValuesInStories < ActiveRecord::Migration[6.0]
  def change
    change_column_default :stories, :grid_width, 19
    change_column_default :stories, :grid_height, 39
  end
end
