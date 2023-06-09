# frozen_string_literal: true

# Pokemon type
class Type < ApplicationRecord
  has_many :pokemons, foreign_key: 'type1_id'
  has_many :pokemons, foreign_key: 'type2_id'

  validates :name, presence: true,
                   length: { maximum: 100 },
                   uniqueness: true
end
