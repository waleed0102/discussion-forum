# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

expert = Expert.create(email: 'expert@gmail.com',
                       name: "expert", status: 0,
                       profession: "Teacher", service: "Education",
                       password: "password")

novice = Novice.create(email: 'novice@gmail.com',
                       name: "novice", status: 0,
                       password: "password")

campaign1 = expert.campaigns.create(title: "Valentines Campaign", purpose: "Flowering", estimated_duration: 0)
campaign2 = expert.campaigns.create(title: "Christmas Campaign", purpose: "Tree Decore", estimated_duration: 1)

discussion_topic = campaign1.discussion_topics.create(title: "Questioning", novice: novice)

comment1 = campaign1.comments.create(title: "Hello dear", user_id: expert.id)
comment2 = campaign1.comments.create(title: "Hello Bro!", user_id: novice.id)

comment3 = discussion_topic.comments.create(title: "Hello dear on dt", user_id: expert.id)
comment4 = discussion_topic.comments.create(title: "Hello Bro on dt", user_id: novice.id)

["Task Creation", "Preparation", "Decor"].each do |title|
  campaign1.todos.create(title: title)
end

["Task Creation", "Preparation", "Decor"].each do |title|
  campaign2.todos.create(title: title)
end
