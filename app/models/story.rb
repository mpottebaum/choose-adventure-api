class Story < ApplicationRecord
    belongs_to :author
    has_many :story_nodes
    has_many :choices, through: :story_nodes

    validates :title, presence: true

    def are_coordinates_available(x, y)
        any_nodes = story_nodes.any? {|node| node.x == x && node.y == y}
        any_choices = choices.any? {|choice| choice.x == x && choice.y == y}
        !any_nodes && !any_choices
    end

    def assign_choice_coordinates(story_node_x, story_node_y, index)
        x_mover = index % 2 == 0 ? (index / -2) : (index / 2.0).ceil
        assigned_x = story_node_x + x_mover
        assigned_y = story_node_y + 2

        while are_coordinates_available(assigned_x, assigned_y) == false
            assigned_y += 1
        end
        {
            x: assigned_x,
            y: assigned_y
        }
    end
end
