class AddColorToChoices < ActiveRecord::Migration[6.0]
  def change
    add_column :choices, :color, :string
  end
end
