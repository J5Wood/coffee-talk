def find_stars_average(coffee)
    if coffee.reviews.any?
        star_sum = 0
        coffee.reviews.each do |review|
            star_sum += review.stars
        end
        coffee.stars = star_sum / coffee.reviews.count
        coffee.save
    end
end

a = Brand.create(name: "Starbucks", location: "Seattle, WA")
b = Brand.create(name: "Dunkin", location: "Canton, MA")
c = Brand.create(name: "Tim Horton's", location: "Oakville, ON")
d = Brand.create(name: "Peet's Coffee", location: "Berkley, CA")
e = Brand.create(name: "Diva Espresso", location: "Seattle, WA")

f = a.coffees.build(name: "Veranda Blend", roast: 1, origin: "Latin America", notes: "Mellow and flavorful with a nice softness.", stars: 4)
g = a.coffees.build(name: "Pike Place Roast", roast: 3, origin: "Latin America", notes: "A smooth, well-rounded blend of Latin American coffees with subtly rich flavors of cocoa and toasted nuts.", stars: 3)
a.coffees.build(name: "Sumatra", roast: 5, origin: "Indonesia", notes: "Full-bodied with a smooth mouthfeel, lingering flavors of dried herbs and fresh earth, and almost no acidity.", stars: 5)
a.save
h = b.coffees.build(name: "Original Blend", roast: 3, origin: "Latin America", notes: "No frills. No fuss. Just great Dunkin’ coffee.", stars: 2)
i = b.coffees.build(name: "Pumpkin Spice", roast: 3, origin: "Latin America", notes: "Fall-friendly flavors of pumpkin, cinnamon and nutmeg", stars: 3)
b.coffees.build(name: "Polar Peppermint", roast: 3, origin: "Latin America", notes: "Sweet tastes of white chocolate and peppermint.", stars: 4)
b.save
j = c.coffees.build(name: "Dark Roast", roast: 4, origin: "Latin America", notes: "Rich and full flavoured dark roast coffee, with a smooth finish.", stars: 3)
k = c.coffees.build(name: "Original Blend", roast: 4, origin: "Latin America", notes: "The taste of Tim Hortons, every time.", stars: 4)
c.coffees.build(name: "Decaf", roast: 5, origin: "Latin America", notes: "Decaffeinated by the Swiss Water process to preserve its signature flavour.", stars: 3)
c.save
l = d.coffees.build(name: "Major Dickason's Blend", roast: 4, origin: "Latin America, Indo-Pacific", notes: "Rich, complex blend", stars: 4)
m = d.coffees.build(name: "Cafe Domingo", roast: 3, origin: "Latin America", notes: "Toast, Toffee, Nougat", stars: 3)
d.coffees.build(name: "House Blend", roast: 4, origin: "Latin America", notes: "Spice, Citrus, Toast", stars: 1)
d.save
n = e.coffees.build(name: "Sumatra Mandheling", roast: 5, origin: "Indonesia", notes: "Single origin, dark roast with deep, smooth flavor.", stars: 5)
o = e.coffees.build(name: "Ethiopian Yirgacheffe", roast: 4, origin: "Ethiopia", notes: "Almost floral and blueberry aroma is to be found at the center of its wild sweetness-soft-toned acidity and superb body.", stars: 4)
e.coffees.build(name: "Mexico", roast: 3, origin: "Mexico", notes: "Balanced, medium bodied with a brisk acidity. ", stars: 4)
e.save

User.create(name: "Jim", password: "password!")
User.create(name: "Jill", password: "password!")
User.create(name: "Ben", password: "password!")
User.create(name: "Jen", password: "password!")

f.reviews.create(content: "Dont like bitter coffee and this is not at all bitter, just the right blend for me, but every bodies taste and palette is different. Just a smooth enjoyable coffee.", user_id: 1, stars: 4)
f.reviews.create(content: "Good if like your coffee mild. If you are looking for strong taste try a different blend.", user_id: 3, stars: 3)
find_stars_average(f)

g.reviews.create(content: "I have always loved this coffee and have been unable to buy several bags at such a good price. very happy. I will be ordering some more.", user_id: 2, stars: 4)
g.reviews.create(content: "Stronger than I expected, which is good. Also it goes very well with almond milk.", user_id: 4, stars: 3)
find_stars_average(g)

h.reviews.create(content: "I have been buying Dunkin' Original Blend Coffee exclusively for over ten years. I frankly hate the new canister. It is hard to open when first purchased, but once open, the canister top easily falls off. It is also NOT even coffee tight. The canister tipped over and coffee spilled out even when the lid stayed on. I am very disappointed with this design. I saved old competitor coffee canisters for homemade cookies, so I transferred Dunkin' coffee into one of those. How is this better than the old bag?", user_id: 1, stars: 1)
h.reviews.create(content: "The coffee tastes very nice. It's amazing. Tastes great. Keeps me awake for a long.", user_id: 2, stars: 4)
find_stars_average(h)

i.reviews.create(content: " I tried it plain and still bad also tried it with vanilla creamer and still bad.", user_id: 3, stars: 2 )
i.reviews.create(content: "There are many versions of pumpkin spiced coffee. I will say in my opinion Dunkin's version of this coffee is a +10 in my book", user_id: 4, stars: 4)
find_stars_average(i)

j.reviews.create(content: "I'm going to say after drinking dark roast for years now it's hard drinking anything else. I really enjoy the flovor. With milk or cream sometimes I even like homemade better then the store.", user_id: 1, stars: 5)
j.reviews.create(content: "You don't get a lot in a bag for how much we have coffee! But it is easy to use and great taste.", user_id: 4, stars: 1)
find_stars_average(j)

k.reviews.create(content: "We purchased this bag of Tim Hortons coffee since we pretty much live there on a daily basis. I actually kind of regret buying it though. It’s definitely not the same as going to the restaurant, doesn’t even taste the same. I just can’t drink it. Some of my friends have enjoyed it, but it’s something I personally don’t like.", user_id: 2, stars: 2)
k.reviews.create(content: "I ordered this coffee from a recommendation of a friend. I had a taste of it at a party 50 miles from my home where they have a well. I made the coffee at home using 'town' chlorinated water,,,, it was oh so NASTY.... bitter and very acidic. So I tried again using distilled water,,,, and it wasn't much better. I then tried using 'bottled spring water',,, and once again I found it to be too acidic for my taste..... so I am out the money (did give the remainder to a friend who was familiar with it) and have learned a very good lesson. The WATER you use DOES make a difference in what you fix with it..... It smells wonderful in the can and while brewing......", user_id: 3, stars: 3)
find_stars_average(k)

l.reviews.create(content: "Major Dickenson is a very good coffee. I would not give it a 5 star, but likely 4 stars. However, the K-Cup Pods are not made right. This brings my rating way down because when you pay this much for something, it ought to be right. I did not get full value because 3 or 4 of the 10 pods were defective. They do no snap down into the coffee maker right and as a result, the water either would not start at all or would not finish only brewing a 1/4 cup or less.", user_id: 4, stars: 2)
l.reviews.create(content: "This is a very strong coffee. I purchased because of all the good reviews. Even a bunch of cream and sugar didn’t make it taste good enough for me. I really like the Peet’s coffee they serve at the New Theater Restaurant but this is definitely not it. I’ll keep trying their other kinds.", user_id: 3, stars: 1)
find_stars_average(l)

m.reviews.create(content: "This is my go to coffee for Cold Brew , I have tried other Peets Blends and other brands that say how great there's is for Cold brew but this is what I always come back to and am now just staying with. Brew it 14 hours and you have a excellent Cold Brew you get the taste of the roast and nutty/chocolate flavors and I just love the smell of it a nice molasses aroma. It can be a little strong but I just add about 4 ounces of water.", user_id: 2, stars: 5)
m.reviews.create(content: "Cafe Domingo is my favorite Peet’s blend so far. It has a good balance and flavor, and is not bitter. The coffee was great but I was not thrilled to have grounds in my cup; in fact, that has never happened except with this box. I think the k-cups are made a little different than most because they rattle like there is something loose inside. Overall, I still prefer Green Mountain Vermont Country Blend for a medium roast coffee.", user_id: 1, stars: 4)
find_stars_average(m)
 
n.reviews.create(content: "The balance of cedar and sage encompasses the earthy flavors Sumatra typically aims for, but weren’t overpowering.", user_id: 2, stars: 4)
n.reviews.create(content: "While the fruit notes are more subtle, this coffee delivers a spicy, earthy aroma in spades - this is truly a cedar and sage forward coffee!", user_id: 4, stars: 5)
find_stars_average(n)

o.reviews.create(content: "Soft and silky, and just oh-so-pleasant, this clean cup offers a classic Ethiopian floral profile with just a drop of lemon acidity.", user_id: 3, stars: 4)
o.reviews.create(content: "Sweet and full. Fragrantly fruity with prominent dried blueberry and white flower.  Really a very delicious coffee.", user_id: 1, stars: 4)
find_stars_average(o)