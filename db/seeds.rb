# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

me = Author.create(name: "Mike")
my_story = Story.create(title: "My Story", desc: "This is my very first story. I hope you like it. I have no idea what it is about. I hope you like it. OK bye.", author: me)
node_one = StoryNode.create(story: my_story, decision: false, next_id: 2, content: "Welcome to my story. Please continue.")
node_two = StoryNode.create(story: my_story, decision: true, prev_id: 1, content: "You've arrived at a decision. Please make a choice in the matter.")
choice_a = Choice.create(story_node: node_two, next_id: 3, content: "Do this thing.")
choice_b = Choice.create(story_node: node_two, next_id: 4, content: "Do that thing.")
node_three = StoryNode.create(story: my_story, decision: false, prev_id: 2, content: "And now you are here. Wasn't that fun?")
node_four = StoryNode.create(story: my_story, decision: false, prev_id: 2, content: "Whoa, bud. What're you tryna pull? You're outta here! Go on. Get!")