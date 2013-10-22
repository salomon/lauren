# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.create(username: 'lauren', password: 'Grad2003', password_confirmation: 'Grad2003')

Post.create(title: 'Crayons', sub_title: 'Why I never learned to color', content: 'In the 5th grade, I was 6 feet tall.', user_id: user.id)
Post.create(title: 'Birthdays', sub_title: "Why my boyfriend can't understand my love for birthdays", content: 'My boyfriend has a mother who is super religous', user_id: user.id)