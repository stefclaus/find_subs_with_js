# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Assistant.create(name: 'Simone Smith', email: 'smith@gmail.com', password: 'password')
Assistant.create(name: 'Paloma Cruzero', email: 'curzero@gmail.com', password: 'password')
Assistant.create(name: 'Juan Castille', email: 'castille@gmail.com', password: 'password')
Yogaclass.create(name: 'Yoga 1.5', time: '8am', weekday: 'Saturday', instructor: 'Sally Smith')
Yogaclass.create(name: 'Yoga 1.5', time: '10am', weekday: 'Sunday', instructor: 'Sarah Smith')
Yogaclass.create(name: 'Pilates', time: '6pm', weekday: 'Thursday', instructor: 'Sarah Smith')
Yogaclass.create(name: 'Beginners Yoga', time: '8pm', weekday: 'Thursday', instructor: 'Emma Silverman')
Subrequest.create(comment: "Going out of town for work", date: '5/18/2019', assistant_requesting: 'Stef', assistant_covering: 'Silpa', assistant_id: '1', yogaclass_id: '1')
Subrequest.create(comment: "I'll make you cookies!", date: '6/20/2019', assistant_requesting: 'Silpa', assistant_covering: 'Ari', assistant_id: '2', yogaclass_id: '2')
