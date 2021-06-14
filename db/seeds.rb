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

user = User.create(name: "Joanna", username: "Joanna", email: "jzappall@gmail.com", password: "Joanna", profile_picture:"https://media-exp1.licdn.com/dms/image/C4E03AQEuOq7VSQrxUw/profile-displayphoto-shrink_200_200/0/1516865513930?e=1629331200&v=beta&t=PzxqUQfhZ3hjjdEsxJBzxzrPQ0D_53uANutxCbM1Pig")

bg1 = Boardgame.create(title: "Taboo", manufacturer: "Hasbro", description: "Family fun, don't say the words on the card!", upc_code: "653569586876", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKSM6AK0nmxaTDxlkMqIv55525iVbIsAoGYB56V9FBItAsHxEKYCgsUKby0lUmdpTZtXPRyEYP&usqp=CAc")

bg2 = Boardgame.create(title: "Visitor in Blackwood Grove", manufacturer: "Resonym", description: "A spacecraft crashes in Blackwood Grove, protected by a powerful forcefield. Why can some objects pass through the forcefield, but others are repelled?", upc_code: "608938948106", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR68rHFf8EtOTtiwU_4uCLGtJn093YaZJAHhQ&usqp=CAU")

r1 = Review.create(title: "Super Fast", description: "wow that was a bit too fast for my liking", overall_rating: 5, replayability: 7, first_time_difficulty: 3, user_id: User.all.sample.id, boardgame_id: Boardgame.all.sample.id)

r2 = Review.create(title: "Doge", description: "like a doge", overall_rating: 9, replayability: 2, first_time_difficulty: 8, user_id: User.all.sample.id, boardgame_id: Boardgame.all.sample.id)

r3 = Review.create(title: "boom", description: "roasted", overall_rating: 3, replayability: 10, first_time_difficulty: 1, user_id: User.all.sample.id, boardgame_id: Boardgame.all.sample.id)

go1 = Gameowner.create(user_id: User.all.sample.id, boardgame_id: Boardgame.all.sample.id)
go2 = Gameowner.create(user_id: User.all.sample.id, boardgame_id: Boardgame.all.sample.id)
go3 = Gameowner.create(user_id: User.all.sample.id, boardgame_id: Boardgame.all.sample.id)
go4 = Gameowner.create(user_id: User.all.sample.id, boardgame_id: Boardgame.all.sample.id)







