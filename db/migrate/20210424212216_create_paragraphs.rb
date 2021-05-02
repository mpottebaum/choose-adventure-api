class CreateParagraphs < ActiveRecord::Migration[6.0]
  def change
    create_table :paragraphs do |t|
      t.integer :story_node_id
      t.string :content

      t.timestamps
    end
  end
end
