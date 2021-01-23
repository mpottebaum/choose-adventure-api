class Author < ApplicationRecord
    has_many :stories

    validates :name, presence: true
end
