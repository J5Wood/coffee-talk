a = Brand.create(name: "Barstucks", location: "Seattle")
b = Brand.create(name: "Dunkin", location: "Canton")
c = Brand.create(name: "Tim Horton's", location: "Oakville")
d = Brand.create(name: "Bigfoot Java", location: "Pacific")
e = Brand.create(name: "Diva", location: "Seattle")

f = a.coffees.build(name: "Roast 1", roast: 1, origin: "Ethiopia", notes: "Tasty", stars: 4)
g = a.coffees.build(name: "Roast 2", roast: 3, origin: "Brazil", notes: "Kinda Tasty", stars: 3)
a.coffees.build(name: "Roast 3", roast: 5, origin: "Indonesia", notes: "Very Tasty", stars: 5)
a.save
h = b.coffees.build(name: "Roast 4", roast: 2, origin: "Vietnam", notes: "Bland", stars: 2)
i = b.coffees.build(name: "Roast 5", roast: 3, origin: "Honduras", notes: "It's Tasty", stars: 4)
b.coffees.build(name: "Roast 6", roast: 4, origin: "Mexico", notes: "Om Nom", stars: 4)
b.save
j = c.coffees.build(name: "Roast 7", roast: 1, origin: "Colombia", notes: "Cool Beans", stars: 3)
k = c.coffees.build(name: "Roast 8", roast: 4, origin: "India", notes: "Burnt and beautiful", stars: 5)
c.coffees.build(name: "Roast 9", roast: 5, origin: "Uganda", notes: "Subtle notes of chocolate and tree bark", stars: 3)
c.save
l = d.coffees.build(name: "Roast 10", roast: 2, origin: "Honduras", notes: "Crisp, bright", stars: 2)
m = d.coffees.build(name: "Roast 11", roast: 3, origin: "Guatemala", notes: "Velvety undertones", stars: 3)
d.coffees.build(name: "Roast 12", roast: 5, origin: "Arkansas", notes: "No", stars: 1)
d.save
n = e.coffees.build(name: "Roast 13", roast: 3, origin: "Hawaii", notes: "Sweet, hints of Caramel", stars: 4)
o = e.coffees.build(name: "Roast 14", roast: 4, origin: "Vietnam", notes: "Smooooth Operator", stars: 5)
e.coffees.build(name: "Roast 15", roast: 5, origin: "Mexico", notes: "Syrupy goodness", stars: 5)
e.save

User.create(name: "Jim", password: "password!")
User.create(name: "Jill", password: "password!")
User.create(name: "Ben", password: "password!")
User.create(name: "Jen", password: "password!")

f.reviews.create(content: "Review Number 1", user_id: 1, stars: 4)
f.reviews.create(content: "Review Number 2", user_id: 3, stars: 3)

g.reviews.create(content: "Review Number 3", user_id: 2, stars: 4)
g.reviews.create(content: "Review Number 4", user_id: 4, stars: 2)

h.reviews.create(content: "Review Number 5", user_id: 1, stars: 1)
h.reviews.create(content: "Review Number 6", user_id: 2, stars: 4)

i.reviews.create(content: "Review Number 7", user_id: 3, stars: 4)
i.reviews.create(content: "Review Number 8", user_id: 4, stars: 4)

j.reviews.create(content: "Review Number 9", user_id: 1, stars: 5)
j.reviews.create(content: "Review Number 10", user_id: 4, stars: 1)

k.reviews.create(content: "Review Number 11", user_id: 2, stars: 2)
k.reviews.create(content: "Review Number 12", user_id: 3, stars: 3)

l.reviews.create(content: "Review Number 13", user_id: 4, stars: 2)
l.reviews.create(content: "Review Number 14", user_id: 3, stars: 1)

m.reviews.create(content: "Review Number 15", user_id: 2, stars: 5)
m.reviews.create(content: "Review Number 16", user_id: 1, stars: 4)
 
n.reviews.create(content: "Review Number 17", user_id: 2, stars: 3)
n.reviews.create(content: "Review Number 18", user_id: 4, stars: 5)

o.reviews.create(content: "Review Number 19", user_id: 3, stars: 2)
o.reviews.create(content: "Review Number 20", user_id: 1, stars: 1)