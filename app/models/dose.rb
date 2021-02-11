class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, :cocktail, :ingredient, presence: true
  validates :cocktail_id, uniqueness: {scope: :ingredient_id}
  validates :cocktail_id, uniqueness: {scope: :ingredient}
end
