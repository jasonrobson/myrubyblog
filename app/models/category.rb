class Category < ApplicationRecord
    # :name
    has_many :posts
end
