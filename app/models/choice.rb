class Choice < ApplicationRecord
    belongs_to :story_node

    validates :content, :next_node_id, :grid_x, :grid_y, presence: true
    validates :next_node_id, numericality: { only_integer: true }
    validates :grid_x, uniqueness: { scope: :grid_y, message: "Choice grid coordinates must be unique" }
    validate :cannot_share_grid_coordinates_with_a_story_node

    private

    def cannot_share_grid_coordinates_with_a_story_node
        if story_node.story.story_nodes.any? { |story_node| story_node.grid_x == grid_x && story_node.grid_y == grid_y}
            errors.add(:grid_x, "Choice grid coordinates must be unique")
            errors.add(:grid_y, "Choice grid coordinates must be unique")
        end
    end
end
