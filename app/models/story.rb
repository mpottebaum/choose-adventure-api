class Story < ApplicationRecord
    belongs_to :author
    has_many :story_nodes
end
