class Choice < ApplicationRecord
    belongs_to :story_node

    validates :content, :x, :y, presence: true
    # validates :next_node_id, numericality: { only_integer: true }
    validates :x, uniqueness: { scope: :y, message: "Choice grid coordinates must be unique" }
    validate :cannot_share_grid_coordinates_with_a_story_node

    private

    def cannot_share_grid_coordinates_with_a_story_node
        if story_node.story.story_nodes.any? { |story_node| story_node.x == x && story_node.y == y}
            errors.add(:x, "Choice grid coordinates must be unique")
            errors.add(:y, "Choice grid coordinates must be unique")
        end
    end
end
