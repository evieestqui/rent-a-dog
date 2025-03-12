# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"
require 'open-uri'

User.destroy_all
Dog.destroy_all

# Create users
puts "Creating user..."
users = [
  {
    email: 'ivy@example.com',
    password: 'password'
  },
  {
    email: 'amber@example.com',
    password: 'password'
  }
]

users.each do |user|
  User.create!(user)
end

# Create dogs
puts "Creating dog..."


locations = [
  "1 Rue de Rivoli, 75001 Paris",
  "2 Avenue de l'Opéra, 75001 Paris",
  "3 Rue Saint-Honoré, 75001 Paris",
  "4 Place Vendôme, 75001 Paris",
  "5 Rue de la Paix, 75002 Paris",
  "6 Boulevard des Capucines, 75002 Paris",
  "7 Rue Montmartre, 75002 Paris",
  "8 Rue Réaumur, 75002 Paris",
  "9 Rue du Faubourg Saint-Denis, 75010 Paris",
  "10 Rue La Fayette, 75009 Paris",
  "11 Boulevard Haussmann, 75009 Paris",
  "12 Rue de Châteaudun, 75009 Paris",
  "13 Rue de Maubeuge, 75009 Paris",
  "14 Rue du Faubourg Poissonnière, 75009 Paris",
  "15 Rue de Paradis, 75010 Paris",
  "16 Rue du Château d'Eau, 75010 Paris",
  "17 Rue du Faubourg Saint-Martin, 75010 Paris",
  "18 Rue de Lancry, 75010 Paris",
  "19 Rue de Marseille, 75010 Paris",
  "20 Rue de la Grange aux Belles, 75010 Paris",
  "21 Rue de Belleville, 75020 Paris",
  "22 Rue des Pyrénées, 75020 Paris",
  "23 Rue de Ménilmontant, 75020 Paris",
  "24 Rue de Bagnolet, 75020 Paris",
  "25 Rue d'Avron, 75020 Paris",
  "26 Rue de Charonne, 75011 Paris",
  "27 Rue de la Roquette, 75011 Paris",
  "28 Rue Oberkampf, 75011 Paris",
  "29 Rue Saint-Maur, 75011 Paris",
  "30 Rue de Lappe, 75011 Paris",
  "31 Rue du Faubourg Saint-Antoine, 75011 Paris",
  "32 Rue de Montreuil, 75011 Paris",
  "33 Rue de la Fontaine au Roi, 75011 Paris",
  "34 Rue Jean-Pierre Timbaud, 75011 Paris",
  "35 Rue Amelot, 75011 Paris",
  "36 Rue Sedaine, 75011 Paris",
  "37 Rue de la Folie Méricourt, 75011 Paris",
  "38 Rue de Malte, 75011 Paris",
  "39 Rue Saint-Sébastien, 75011 Paris",
  "40 Rue de Crussol, 75011 Paris",
  "41 Rue de Turenne, 75003 Paris",
  "42 Rue des Archives, 75003 Paris",
  "43 Rue de Bretagne, 75003 Paris",
  "44 Rue Charlot, 75003 Paris",
  "45 Rue de Montmorency, 75003 Paris",
  "46 Rue du Temple, 75003 Paris",
  "47 Rue Vieille du Temple, 75003 Paris",
  "48 Rue des Gravilliers, 75003 Paris",
  "49 Rue Notre-Dame de Nazareth, 75003 Paris",
  "50 Rue Réaumur, 75003 Paris",
  "51 Rue du Pont aux Choux, 75003 Paris",
  "52 Rue de Poitou, 75003 Paris",
  "53 Rue de Saintonge, 75003 Paris",
  "54 Rue Debelleyme, 75003 Paris",
  "55 Rue Froissart, 75003 Paris",
  "56 Rue de Turbigo, 75003 Paris",
  "57 Rue de Picardie, 75003 Paris",
  "58 Rue Dupetit-Thouars, 75003 Paris",
  "59 Rue Perrée, 75003 Paris",
  "60 Rue Béranger, 75003 Paris",
  "61 Rue de la Corderie, 75003 Paris",
  "62 Rue de Franche-Comté, 75003 Paris",
  "63 Rue Gabriel Vicaire, 75003 Paris",
  "64 Rue Meslay, 75003 Paris",
  "65 Rue Notre-Dame de Nazareth, 75003 Paris",
  "66 Rue Volta, 75003 Paris",
  "67 Rue au Maire, 75003 Paris",
  "68 Rue des Vertus, 75003 Paris",
  "69 Rue de Montmorency, 75003 Paris",
  "70 Rue du Bourg l'Abbé, 75003 Paris",
  "71 Rue Saint-Martin, 75003 Paris",
  "72 Rue Quincampoix, 75003 Paris",
  "73 Rue Beaubourg, 75003 Paris",
  "74 Rue Michel le Comte, 75003 Paris",
  "75 Rue Greneta, 75003 Paris",
  "76 Rue du Caire, 75003 Paris",
  "77 Rue d'Aboukir, 75002 Paris",
  "78 Rue de Cléry, 75002 Paris",
  "79 Rue de la Lune, 75002 Paris",
  "80 Rue de Palestro, 75002 Paris",
  "81 Rue Saint-Denis, 75002 Paris",
  "82 Rue de la Cossonnerie, 75001 Paris",
  "83 Rue Berger, 75001 Paris",
  "84 Rue du Louvre, 75001 Paris",
  "85 Rue Coquillière, 75001 Paris",
  "86 Rue Jean-Jacques Rousseau, 75001 Paris",
  "87 Rue du Bouloi, 75001 Paris",
  "88 Rue des Petits Champs, 75001 Paris",
  "89 Rue Croix des Petits Champs, 75001 Paris",
  "90 Rue des Bons Enfants, 75001 Paris",
]


images = [
  "https://cdn.pixabay.com/photo/2018/03/31/06/31/dog-3277416_640.jpg",
  "https://cdn.pixabay.com/photo/2020/11/22/20/12/schafer-dog-5767834_640.jpg",
  "https://cdn.pixabay.com/photo/2020/05/24/08/42/dog-5213090_640.jpg",
  "https://cdn.pixabay.com/photo/2017/03/27/13/23/dog-2178696_640.jpg",
  'https://cdn.pixabay.com/photo/2022/05/18/17/50/dog-7205842_1280.jpg',
  'https://cdn.pixabay.com/photo/2016/11/22/23/13/dog-1851107_1280.jpg',
  'https://cdn.pixabay.com/photo/2021/11/23/09/47/animal-6818310_1280.jpg',
  'https://cdn.pixabay.com/photo/2023/03/09/02/04/winter-7839076_1280.jpg',
  'https://cdn.pixabay.com/photo/2022/01/11/08/57/cairn-terrier-6930052_1280.jpg',
  'https://cdn.pixabay.com/photo/2022/11/18/15/20/greyhound-7600362_1280.jpg',
  'https://cdn.pixabay.com/photo/2018/10/10/15/27/dalmatian-3737539_1280.jpg',
  'https://cdn.pixabay.com/photo/2015/03/14/04/02/soap-bubbles-672658_1280.jpg',
  'https://cdn.pixabay.com/photo/2024/01/11/12/46/border-collie-8501579_1280.jpg',
  'https://cdn.pixabay.com/photo/2020/11/24/17/54/dog-5773397_1280.jpg',
  'https://cdn.pixabay.com/photo/2021/09/05/17/23/dog-6600031_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/12/11/15/21/collie-3012485_1280.jpg',
  'https://cdn.pixabay.com/photo/2020/12/21/23/49/australian-shepherd-5851158_1280.jpg',
  'https://cdn.pixabay.com/photo/2023/12/09/15/04/dog-8439530_1280.jpg',
  'https://cdn.pixabay.com/photo/2020/07/27/13/27/dog-5442450_1280.jpg',
]
# result = JSON.parse(URI.parse('https://pixabay.com/api/?key=41736059-c69f22556a428de2e797db65c&q=dogs&image_type=photo&pretty=true').read)

images.count.times do |index|
  location = locations.pop
  dog = Dog.create!(
    name: Faker::Creature::Dog.name,
    address: location,
    breed: Faker::Creature::Dog.breed,
    size: Faker::Creature::Dog.size,
    user: User.first
  )

  # url = result['hits'].sample['largeImageURL']
  url = images[index]
  file = URI.parse(url).open
  dog.image.attach(io: file, filename: 'dog.jpg', content_type: 'image/jpg')
end
