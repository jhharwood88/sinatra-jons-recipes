jon = User.create(name: "Jon", email: "jon@jon.com", password: "password")

jon.recipes.create(name: "pizza", ingredients: "dough, cheese, sauce", procedures: "put together and bake")
