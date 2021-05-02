class StoryNode < ApplicationRecord
    belongs_to :story
    has_many :choices
    accepts_nested_attributes_for :choices
    has_many :paragraphs
    accepts_nested_attributes_for :paragraphs

    validates :x, :y, presence: true
    # validates :x, uniqueness: { scope: :y, message: "Story node grid coordinates must be unique" }, on: :update
    validate :cannot_have_both_next_node_id_and_choices
    validate :cannot_share_grid_coordinates_with_a_story_node
    validate :cannot_share_grid_coordinates_with_a_choice
    validates_inclusion_of :color, :in => %w(red orange yellow green blue purple), :allow_nil => true

    before_destroy :destroy_choices_and_paragraphs

    private

    def cannot_have_both_next_node_id_and_choices
        if next_node_id.present? && choices.length > 0
            errors.add(:next_node_id, "Node cannot have both a next_node_id and choices")
        end
    end

    def cannot_share_grid_coordinates_with_a_story_node
        other_nodes = story.story_nodes.filter { |node| node.id != id }
        if other_nodes.any? { |story_node| story_node.x == x && story_node.y == y}
            errors.add(:x, "Story node grid coordinates must be unique")
            errors.add(:y, "Story node grid coordinates must be unique")
        end
    end

    def cannot_share_grid_coordinates_with_a_choice
        if story.choices.any? { |choice| choice.x == x && choice.y == y}
            errors.add(:x, "Story node grid coordinates must be unique")
            errors.add(:y, "Story node grid coordinates must be unique")
        end
    end

    def destroy_choices_and_paragraphs
        choices.destroy_all
        paragraphs.destroy_all
    end
end
