A user should be able to....

- C Add their recipe to favorites
- R Search for a recipe/view recipes
- U Edit a recipe
- D Remove a recipe

Add notes to a recipe <-- Edit, or adding another related model?

# Models

## User
### attributes:
- name
- email
- password

### relationships
has_many :recipes

## Recipe
### attributes:
- ingredients
- procedures

### relationships
belongs_to :user
