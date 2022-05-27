# USERS

users = [{
  :name => "Bertrand",
  :photo => "https://randomuser.me/api/portraits/men/87.jpg",
  :bio => "Full-stack Web developer"
},{
  :name => "Anna",
  :photo => "https://randomuser.me/api/portraits/women/60.jpg",
  :bio => "Fashion Designer"
},{
  :name => "Jane",
  :photo => "https://randomuser.me/api/portraits/women/31.jpg",
  :bio => "News Reporter"
},{
  :name => "Big Sam",
  :photo => "https://randomuser.me/api/portraits/men/34.jpg",
  :bio => "Soccer Player"
},
{
  :name => "X kay",
  :photo => "https://randomuser.me/api/portraits/men/20.jpg",
  :bio => "Professional DJ"
},
{
  :name => "Diane",
  :photo => "https://randomuser.me/api/portraits/women/20.jpg",
  :bio => "Poetess and author"
},
{
  :name => "Jolly",
  :photo => "https://randomuser.me/api/portraits/women/22.jpg",
  :bio => "Public figure"
}]

users.each do |user|
  User.create(name: user[:name], photo: user[:photo], bio: user[:bio])
end

# POSTS

post_text = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor
 invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo
  duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
   Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore
    magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,
     no sea takimata sanctus est Lorem ipsum dolor sit amet."

posts = [{
  :title => "Ruby Best practices every developer should follow",
  :text => post_text,
  :author_id => 1
},{
  :title => "Elon Masks finally bought twitter!",
  :text => post_text,
  :author_id => 3
},{
  :title => "10 best dribbles I did",
  :text => post_text,
  :author_id => 4
},{
  :title => "10 ways you can rip your jeans",
  :text => post_text,
  :author_id => 2
},{
  :title => "Global Warming",
  :text => post_text,
  :author_id => 3
},{
  :title => "Transpiration",
  :text => post_text,
  :author_id => 1
},{
  :title => "Top 5 exercises for your core",
  :text => post_text,
  :author_id => 4
},{
  :title => "Trending decks to give a shot 2022",
  :text => post_text,
  :author_id => 5
},
{
  :title => "Book: In the mirrow",
  :text => post_text,
  :author_id => 6
},
{
  :title => "Trending fashion brands in 2022",
  :text => post_text,
  :author_id => 7
},
{
  :title => "Poem: Bye 2022!",
  :text => post_text,
  :author_id => 6
}]

posts.each do |post|
  Post.create(title: post[:title], text: post[:text] ,author_id: post[:author_id])
end

# COMMENTS

comments = [{
  :text => "Nemo enim ipsam",
  :author_id => 4,
  :post_id => 6
},{
  :text => "labore et dolore",
  :author_id => 3,
  :post_id => 4
},{
  :text => "Mauris commodo quis",
  :author_id => 3,
  :post_id => 3
},{
  :text => "Elementum pulvinar etiam ",
  :author_id => 1,
  :post_id => 5
},{
  :text => "perspiciatis unde omnis",
  :author_id => 2,
  :post_id => 1
},{
  :text => "Elit at imperdiet dui",
  :author_id => 2,
  :post_id => 2
},{
  :text => "Adipiscing enim eu turpis",
  :author_id => 2,
  :post_id => 5
},{
  :text => "Ornare arcu dui vivamus",
  :author_id => 3,
  :post_id => 7
},{
  :text => "Volutpat odio facilisis ",
  :author_id => 1,
  :post_id => 3
},{
  :text => "architecto beatae vitae ",
  :author_id => 1,
  :post_id => 4
},{
  :text => "natus error sit voluptatem accusantium ",
  :author_id => 3,
  :post_id => 8
},{
  :text => "Ut enim ad minima veniam",
  :author_id => 3,
  :post_id => 1
},{
  :text => "aliquid ex ea commodi",
  :author_id => 1,
  :post_id => 8
},{
  :text => "Et tortor consequat id",
  :author_id => 2,
  :post_id => 7
},{
  :text => "Maecenas ultricies mi",
  :author_id => 4,
  :post_id => 2
},{
  :text => "Et tortor consequat id",
  :author_id => 7,
  :post_id => 2
}]

comments.each do |comment|
  Comment.create(text: comment[:text], author_id: comment[:author_id], post_id: comment[:post_id])
end

# LIKES

likes = [{
  :author_id => 3,
  :post_id => 1
},{
  :author_id => 2,
  :post_id => 3
},{
  :author_id => 4,
  :post_id => 8
},{
  :author_id => 1,
  :post_id => 5
},{
  :author_id => 4,
  :post_id => 2
},{
  :author_id => 1,
  :post_id => 6
},{
  :author_id => 3,
  :post_id => 1
},{
  :author_id => 2,
  :post_id => 3
},{
  :author_id => 1,
  :post_id => 4
},{
  :author_id => 1,
  :post_id => 5
},{
  :author_id => 3,
  :post_id => 7
},{
  :author_id => 4,
  :post_id => 2
},{
  :author_id => 1,
  :post_id => 6
},{
  :author_id => 3,
  :post_id => 1
},{
  :author_id => 1,
  :post_id => 4
},{
  :author_id => 4,
  :post_id => 8
},{
  :author_id => 3,
  :post_id => 7
},{
  :author_id => 4,
  :post_id => 2
},{
  :author_id => 1,
  :post_id => 6
}]

likes.each do |like|
  Like.create(author_id: like[:author_id], post_id: like[:post_id])
end
