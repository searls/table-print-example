require_relative "../config/environment"

post_id = ARGV[0]
tag_name = ARGV[1]
author_name = ARGV[2]

unless [post_id,tag_name,author_name].all?
  puts <<~USAGE
  Usage:

    $ ruby script/tag_post.rb <POST_ID> <TAG_NAME> <AUTHOR_NAME>

    Example:

      $ ruby script/tag_post.rb 42 cooking Jack

    Will tag the post with ID "42" with a tag labeled "cooking",
    creating a new tag if one doesn't already exist, and attributing the tag
    to the user named "Jack"
  USAGE
  exit 1
end

post = Post.find(post_id)
author = Author.find_by(:name => author_name)

puts "Tagging post '#{post.title}' with `#{tag_name}` by #{author.name}"
post.tag_post!(tag_name, author)
