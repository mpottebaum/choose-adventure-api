class Story < ApplicationRecord
    belongs_to :author
    has_many :story_nodes
    has_many :choices, through: :story_nodes

    validates :title, presence: true

    def are_coordinates_available(grid_x, grid_y)
        any_nodes = story_nodes.any? {|node| node.grid_x == grid_x && node.grid_y == grid_y}
        any_choices = choices.any? {|choice| choice.grid_x == grid_x && choice.grid_y == grid_y}
        !any_nodes && !any_choices
    end

    def assign_choice_coordinates(story_node_grid_x, story_node_grid_y, index)
        x_mover = index % 2 == 0 ? (index / -2) : (index / 2.0).ceil
        assigned_x = story_node_grid_x + x_mover
        assigned_y = story_node_grid_y + 2

        while are_coordinates_available(assigned_x, assigned_y) == false
            assigned_y += 1
        end
        {
            grid_x: assigned_x,
            grid_y: assigned_y
        }
    end
end
