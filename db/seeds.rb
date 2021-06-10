# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Gameowner.all.destroy_all 
Review.all.destroy_all
User.all.destroy_all
Boardgame.all.destroy_all


user = User.create(name: "Mike", username: "Mike", email: "iaconom821@gmail.com", password: "Mike", profile_picture: "https://avatars.githubusercontent.com/u/77515394?v=4" )

bg1 = Boardgame.create(title: "Taboo", manufacturer: "Hasbro", description: "Family fun, don't say the words on the card!")

r1 = Review.create(title: "Super Fast", description: "wow that was a bit too fast for my liking", overall_rating: 5, replayability: 7, first_time_difficulty: 3, user_id: User.all.sample.id, boardgame_id: Boardgame.all.sample.id)

go1 = Gameowner.create(user_id: User.all.sample.id, boardgame_id: Boardgame.all.sample.id)






