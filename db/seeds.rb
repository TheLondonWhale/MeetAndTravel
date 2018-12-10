# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

array_cat = [
"Hébergement", "Restauration", "Sorties", "Activités", "Shopping"
]
array_cat.each do |list|

    Category.create(name: list)

end

User.create(firstname: "Mouss",lastname: "Ait", username: "Moumouss", password:"azerty", password_confirmation: "azerty", email: "mouss@gmail.com")

User.create(firstname: "Virginie",lastname: "Valeur", username: "VVH", password:"azerty", password_confirmation: "azerty", email: "vir@gmail.com")

Tip.create(creator_id: "1", title: "Coucou", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.").categories << [Category.find(1), Category.find(2), Category.find(3)]


Tip.create(creator_id: "1", title: "Resto Naples", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ").categories << [Category.find(1),Category.find(3)]


Tip.create(creator_id: "2", title: "Sortie plongée sous-marine", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.").categories << Category.find(3)

Like.create(user_id: "1", tip_id: "3")
Like.create(user_id: "2", tip_id: "2")

Comment.create(content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", user_id: "2", tip_id: "3")
Comment.create(content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ", user_id: "1", tip_id: "2")
