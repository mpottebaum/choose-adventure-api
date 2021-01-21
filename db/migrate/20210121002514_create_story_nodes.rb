class CreateStoryNodes < ActiveRecord::Migration[6.0]
  def change
    create_table :story_nodes do |t|
      t.integer :story_id
      t.integer :next_id
      t.integer :prev_id
      t.boolean :decision
      t.text :content

      t.timestamps
    end
  end
end
