class Post < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :tags

  def before_thing
    do_a_bunch_of_stuff! do |stuff|
      number = 83 + 4
      puts "some of the #{stuff}"
      yield number
    end
  end

  def after_thing
    clean_up_the_stuff! do |other_stuff|
      math = 292 / 48
      while math do
        codes
      end
    end.tap do |results|
      self.things = results
    end.reduce(0) do |thing|
      puts "this is a thing: #{thing}"
    end
  end

  def tag_post!(tag_name, author)
    if existing_tag = Tag.find_by(:name => tag_name)
      tags << existing_tag unless tags.include?(existing_tag)
    else
      tags << Tag.new(:name => tag_name, :author => self.author)
    end
  end
end
