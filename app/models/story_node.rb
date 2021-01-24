class StoryNode < ApplicationRecord
    belongs_to :story
    has_many :choices
    accepts_nested_attributes_for :choices

    validates :content, presence: true
    validate :cannot_have_both_next_node_id_and_choices

    private

    def cannot_have_both_next_node_id_and_choices
        if next_node_id.present? && choices.length > 0
            errors.add(:next_node_id, "Node cannot have both a next_node_id and choices")
        end
    end
end
