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
Yogaclass.create(name: 'Yoga 1.5', time: '8am Saturday', instructor: 'Sally Smith')
Yogaclass.create(name: 'Yoga 1.5', time: '10am Sunday', instructor: 'Sarah Smith')
Yogaclass.create(name: 'Pilates', time: '6pm Thursday', instructor: 'Sarah Smith')
Yogaclass.create(name: 'Beginners Yoga', time: '8pm Thursday', instructor: 'Emma Silverman')
