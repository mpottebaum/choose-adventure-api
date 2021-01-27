class StoryNode < ApplicationRecord
    belongs_to :story
    has_many :choices
    accepts_nested_attributes_for :choices

    validates :content, :grid_x, :grid_y, presence: true
    validates :grid_x, uniqueness: { scope: :grid_y, message: "Grid coordinates must be unique" }
    validate :cannot_have_both_next_node_id_and_choices
    validates_inclusion_of :color, :in => %w(red orange yellow green blue purple), :allow_nil => true

    private

    def cannot_have_both_next_node_id_and_choices
        if next_node_id.present? && choices.length > 0
            errors.add(:next_node_id, "Node cannot have both a next_node_id and choices")
        end
    end
end
