class AddGridCoordinatesToChoices < ActiveRecord::Migration[6.0]
  def change
    add_column :choices, :grid_x, :integer
    add_column :choices, :grid_y, :integer
  end
end
