class Choice < ApplicationRecord
    belongs_to :story_node

    validates :content, :next_node_id, presence: true
    validates :next_node_id, numericality: { only_integer: true }
end
