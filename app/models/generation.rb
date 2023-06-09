# frozen_string_literal: true

# Pokemon generation
class Generation < ApplicationRecord
  has_many :pokemons

  validates :number,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 },
            uniqueness: true
end
