# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Trump', party: 'Republican', picture: 'https://lh5.googleusercontent.com/-Sv0q6lkSAGM/AAAAAAAAAAI/AAAAAAAAAVA/9wS9aK9rScw/s0-c-k-no-ns/photo.jpg',         dataset: [18, 1, 19, 3, 20, 1, 21, 1, 22, 1, 23, 1, 24,1, 25, 1, 26, 3, 27, 3, 28, 1, 29, 1])
User.create(name: 'Hillary', party: 'Democrat', picture: 'https://upload.wikimedia.org/wikipedia/commons/2/27/Hillary_Clinton_official_Secretary_of_State_portrait_crop.jpg', dataset: [18, 3, 19, 3, 20, 3, 21, 3, 22, 3, 23, 3, 24,3, 25, 3, 26, 1, 27, 2, 28, 3, 29, 3])
User.create(name: 'Garry', party: 'Libertarian', picture: 'http://thelibertarianrepublic.com/wp-content/uploads/2016/01/Gary-Johnsonx-large-1.jpg',                           dataset: [18, 1, 19, 1, 20, 1, 21, 1, 22, 3, 23, 1, 24,3, 25, 3, 26, 1, 27, 1, 28, 1, 29, 1])
User.create(name: 'Stein', party: 'Green', picture: 'https://pbs.twimg.com/profile_images/756593715833995264/58FJ0pQJ.jpg',                                                   dataset: [18, 1, 19, 3, 20, 1, 21, 3, 22, 1, 23, 3, 24,3, 25, 3, 26, 1, 27, 1, 28, 1, 29, 3])