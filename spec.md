# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

    - Built new rails app

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 

    - Brand has many Coffees, Coffee has many Reviews, and User has many Reviews

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)

    - Coffees belongs to a Brand, and Reviews belong to a User and a Coffee

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)

    - Brand has many Reviews through Coffees, Coffee has many Users through Reviews, and User has many Coffees through Reviews

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)

    - Coffee has many Users through Reviews, and User has many Coffees through Reviews

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)

    - Reviews have an attribute called content that is submitted via form by the user.

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

    - All models contain attribute validations for creation or editing. 

- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

    - 



- [x] Include signup (how e.g. Devise)

    - Handled in UsersController with new and create routes

- [x] Include login (how e.g. Devise)

    - Handled in SessionsController with new and create routes

- [x] Include logout (how e.g. Devise)

    - Handled in SessionsController

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)

    - Includes Github signup through Omniauth.


- [x] Include nested resource show or index (URL e.g. users/2/recipes)

    - brands/:id/coffees/:id

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)

    - coffees/:id/reviews/new and brands/:id/coffees/new

- [x] Include form display of validation errors (form URL e.g. /recipes/new)

    - brands/new brands/edit coffees/new coffees/edit reviews/new reviews/edit users/new users/edit login

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate