class AddGridWidthToStories < ActiveRecord::Migration[6.0]
  def change
    add_column :stories, :grid_width, :integer, default: 50
  end
end
