class AddTypesToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_reference :pokemons, :type1, null: false, foreign_key: { to_table: :types }
    add_reference :pokemons, :type2, foreign_key: { to_table: :types }
  end
end
