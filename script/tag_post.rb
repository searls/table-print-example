require_relative "../config/environment"

tag_name = ARGV[0]
author_name = ARGV[1]

post = Post.last
author = Author.find_by(:name => author_name)

puts "Tagging last post '#{post.title}' with `#{tag_name}` by #{author.name}"
post.tag_post!(tag_name, author)
