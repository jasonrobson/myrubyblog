class Post < ApplicationRecord
    # :title, :body, :category_id, :authour_id
    belongs_to :category
end
