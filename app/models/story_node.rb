class StoryNode < ApplicationRecord
    belongs_to :story
    has_many :choices
    accepts_nested_attributes_for :choices

    validates :content, :grid_x, :grid_y, presence: true
    validates :grid_x, uniqueness: { scope: :grid_y, message: "Story node grid coordinates must be unique" }
    validate :cannot_have_both_next_node_id_and_choices
    validate :cannot_share_grid_coordinates_with_a_choice
    validates_inclusion_of :color, :in => %w(red orange yellow green blue purple), :allow_nil => true

    before_destroy :destroy_choices

    private

    def cannot_have_both_next_node_id_and_choices
        if next_node_id.present? && choices.length > 0
            errors.add(:next_node_id, "Node cannot have both a next_node_id and choices")
        end
    end

    def cannot_share_grid_coordinates_with_a_choice
        if story.choices.any? { |choice| choice.grid_x == grid_x && choice.grid_y == grid_y}
            errors.add(:grid_x, "Story node grid coordinates must be unique")
            errors.add(:grid_y, "Story node grid coordinates must be unique")
        end
    end

    def destroy_choices
        choices.destroy_all
    end
end
