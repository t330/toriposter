# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# families

columbidae = Classification.create(name: 'ハト科')

# genera

columba = columbidae.children.create(name: 'カワラバト属')
streptopelia = columbidae.children.create(name: 'キジバト属')
chalcophaps = columbidae.children.create(name: 'キンバト属')
treron = columbidae.children.create(name: 'アオバト属')
ptilinopus = columbidae.children.create(name: 'ヒメアオバト属')

# species

oenas = columba.children.create(name: 'ヒメモリバト')
janthina = columba.children.create(name: 'カラスバト')
columba.children.create([{name: 'オガサワラカラスバト'}, {name: 'リュウキュウカラスバト'}, {name: 'カワラバト(ドバト)'}])
orientalis = streptopelia.children.create(name: 'キジバト')
decaocto = streptopelia.children.create(name: 'シラコバト')
tranquebarica = streptopelia.children.create(name: 'ベニバト')
indica = chalcophaps.children.create(name: 'キンバト')
sieboldii = treron.children.create(name: 'アオバト')
formosae = treron.children.create(name: 'ズアカアオバト')
leclancheri = ptilinopus.children.create(name: 'クロアゴヒメアオバト')

# subspecies

janthina.children.create([{name: 'カラスバト'}, {name: 'アカガシラカラスバト'}, {name: 'ヨナグニカラスバト'}])
orientalis.children.create([{name: 'キジバト'}, {name: 'リュウキュウキジバト'}])
decaocto.children.create(name: 'シラコバト')
tranquebarica.children.create(name: 'ベニバト')
indica.children.create(name: 'キンバト')
sieboldii.children.create(name: 'アオバト')
formosae.children.create([{name: 'ズアカアオバト'}, {name: 'チュウダイズアカアオバト'}])
leclancheri.children.create(name: 'クロアゴヒメアオバト')



#oenas_ssp = oenas.children.create(name: '亜種不明')
#janthina_1 = janthina.children.create(name: 'カラスバト')
#nitens = janthina.children.create(name: 'アカガシラカラスバト')
#stejnegeri = janthina.children.create(name: 'ヨナグニカラスバト')
#orientalis_1 = orientalis.children.create(name: 'キジバト')
#stimpsoni = orientalis.children.create(name: 'リュウキュウキジバト')
#decaocto_1 = decaocto.children.create(name: 'シラコバト')
#decaocto_2 = decaocto.children.create(name: 'シラコバト(外来種)')
#humilis = tranquebarica.children.create(name: 'ベニバト')
#yamashinai = indica.children.create(name: 'キンバト')
#sieboldii_1 = sieboldii.children.create(name: 'アオバト')
#permagnus = formosae.children.create(name: 'ズアカアオバト')
#medioximus = formosae.children.create(name: 'チュウダイズアカアオバト')
#taiwanus = leclancheri.children.create(name: 'クロアゴヒメアオバト')