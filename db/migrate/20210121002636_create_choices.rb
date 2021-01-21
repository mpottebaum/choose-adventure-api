class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices do |t|
      t.integer :story_node_id
      t.integer :next_id
      t.text :content

      t.timestamps
    end
  end
end
