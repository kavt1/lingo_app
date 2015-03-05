require 'json'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  # songs = Song.create(
  #   title: 'Perhaps Perhaps Perhaps SEED',
  #   author: 'Cake',
  #   time: 2.24,
  #   lyric_lineID: 'A million times Ive asked you,
  #   And then I ask you over again You only answer
  #   Perhaps, perhaps, perhaps')


  p song = JSON.parse(open('../lib/assets/data/perhaps.json').read)
