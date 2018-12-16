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

User.create(firstname: "Mustapha",lastname: "Ait", username: "Mouss", password:"azerty", password_confirmation: "azerty", email: "ait.mus06@gmail.com", longitude: "2.287592", latitude: "48.862725",description: "J’adore découvrir de nouveaux fruits et légumes, je voyage beaucoup pour découvrir de nouveaux produits" , admin: true, birthdate: "1993-04-06")
User.create(firstname: "Virginie",lastname: "Valeur", username: "VVH", password:"azerty", password_confirmation: "azerty", email: "virvaleur@hotmail.com", longitude: "2.337644", latitude: "48.860611",description: "A la recherche de bons spots autour du monde" , admin: true, birthdate: "1993-04-06")
User.create(firstname: "Anaïs",lastname: "Diologeant", username: "Ana", password:"azerty", password_confirmation: "azerty", email: "anais.diologeant@hotmail.fr", longitude: "2.385683", latitude: "48.835455", description: "J’aime voyager et je pars faire un road trip de 6 mois en Asie du Sud-Est, si vous connaissez de bons plans là-bas je suis preneuse "  , admin: true, birthdate: "1993-04-06")
User.create(firstname: "Thomas",lastname: "Perus", username: "Tom", password:"azerty", password_confirmation: "azerty", email: "thomas.perus@espeme.com", longitude: "2.298088", latitude: "48.855899",description: "Hello, j’adore le ski et je compte me faire un petit voyage en Asie, à bientôt" , admin: true, birthdate: "1993-04-06")
User.create(firstname: "Emilie",lastname: "Mussano", username: "Emi", password:"azerty", password_confirmation: "azerty", email: "emi@emi.fr", longitude: "2.2769", latitude: "48.8637",description: "Grande fan de New-York, je vais y rester quelques mois" , admin: true, birthdate: "1993-04-06")
User.create(firstname: "Estelle",lastname: "Marignac", username: "Estrella", password:"azerty", password_confirmation: "azerty", email: "estelle@estelle.fr", longitude: "2.338629", latitude: "48.860294",description: "J’adore la thailande et l’italie,je peux vous donner de très bonnes adresses", birthdate: "1993-04-06")
User.create(firstname: "Anne",lastname: "Boucly", username: "Anne", password:"azerty", password_confirmation: "azerty", email: "anneb@anne.fr", longitude: "2.333333", latitude: "48.866667",description: "J’ai vécu à Lisonne et en martinique, je voyage assez régulièrement pour mon travail , peut-être à bientôt autour d’un verre?", birthdate: "1993-04-06")
User.create(firstname: "Thomas",lastname: "Grimmonprez", username: "Thomas", password:"azerty", password_confirmation: "azerty", email: "tom@tom.fr", longitude: "2.332400", latitude: "48.884129",description: "Je suis musicien et je voyage pas mal pour donner des concerts, vous êtes les bienvenus", birthdate: "1993-04-06")
User.create(firstname: "Annabelle",lastname: "Aurejac", username: "Nana", password:"azerty", password_confirmation: "azerty", email: "anna@anna.fr", longitude: "2.35", latitude: "48.853",description: "Je vis au maroc 6 mois de l’année, n’hésitez-pas à me contacter", birthdate: "1993-04-06")
User.create(firstname: "Marie-Eve",lastname: "Leroy", username: "Marie", password:"azerty", password_confirmation: "azerty", email: "marie@marie.fr", longitude: "2,3695", latitude: "48,8533",description: "J’adore partir en voyage avec mon copain, on va bientôt partir quelques mois en europe", birthdate: "1993-04-06")
