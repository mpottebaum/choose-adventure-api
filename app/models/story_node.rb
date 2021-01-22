class StoryNode < ApplicationRecord
    belongs_to :story
    has_many :choices
    accepts_nested_attributes_for :choices
end
