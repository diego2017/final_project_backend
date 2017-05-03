# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Welcome to this seed script :)"


s1 = Student.create(first_name:'Diego', last_name:'Villanueva', bio:'bla bla bla', email:'diego@a.com', linkedin_id:'2342ff24@', linkedin_url:'ajsoa.com', facebook_url:'afgwif.com', github_url:'sds.com', website_url:'asa.com', img_url:'https://cdn1.iconfinder.com/data/icons/ninja-things-1/1772/ninja-simple-512.png')

c1 = Course.create(name:'WDI 19')
c2 = Course.create(name:'WDI 20')
c3 = Course.create(name:'WDI 21')

sk1 = Skill.create(name:'CSS')
sk2 = Skill.create(name:'javascript')
sk3 = Skill.create(name:'html')

i1 = Interest.create(name:'coding')
i2 = Interest.create(name:'movies')
i3 = Interest.create(name:'drinking')

s1.skills << sk1
s1.skills << sk2
s1.skills << sk3

s1.interests << i1
s1.interests << i2
s1.interests << i3

s1.courses << c1


puts "Our job here is done!"
