class Post < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :tags

  def tag_post!(tag_name, author)
    if existing_tag = Tag.find_by(:name => tag_name)
      tags << existing_tag unless tags.include?(existing_tag)
    else
      tags << Tag.new(:name => tag_name, :author => self.author)
    end
  end
end
