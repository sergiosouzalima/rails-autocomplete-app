# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
User.destroy_all
User.where(name: 'Carolina', email: 'carol@gmail.com').first_or_create
User.where(name: 'Patricia', email: 'paty@gmail.com').first_or_create
User.where(name: 'Cibelle', email: 'cibelle@gmail.com').first_or_create
User.where(name: 'Isabel' , email: 'isa@gmail.com').first_or_create
User.where(name: 'Monica' , email: 'moniquinha@gmail.com').first_or_create
User.where(name: 'Maria' , email: 'maria@gmail.com').first_or_create

Role.destroy_all
Role.where(name: 'admin').first_or_create
Role.where(name: 'operator').first_or_create
Role.where(name: 'manager').first_or_create

