class Author < ApplicationRecord
  has_many :tags
  has_many :posts
end
