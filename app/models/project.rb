class Project < ApplicationRecord
    # Title and description exist
    validates_presence_of :title, :description
end
