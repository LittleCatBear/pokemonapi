# API Pokémon (Rails API)

API construite avec Ruby on Rails 7.0.5 et Ruby 3.2.2 pour gérer les pokémons

## Modèles de données

L'API est construite autour de trois principaux modèles de données :

### Pokemon

Il s'agit du modèle central de l'application. Chaque pokemon a un nom unique (le numéro n'est pas unique). Le total des statistiques est un champ calculé, stocké également en base de données. Chaque pokemon a minimum 1 type et maximum 2 types, et appartient à une seul génération.

### Type

Chaque type a un nom unique et peut être associé à plusieurs Pokémon, soit en tant que type principal (type1), soit en tant que type secondaire (type2).

### Generation

Chaque génération a un numéro unique et comporte de nombreux Pokémon.

## Installation

1. **Téléchargez le repo**
   ```
   git clone git@github.com:LittleCatBear/pokemonapi.git
   ```
2. **Lancer PostgreSQL**
3. **Créer et remplir la base de données**
   ```
   rails db:create
   rails db:seed
   ```
4. **Démarrer le serveur**
   ```
   rails s
   ```

## Requêtes disponibles\*\*

Voici quelques exemples de requêtes pour `PokemonsController` (à l'aide de Postman ou autre outils):

- **GET** `/pokemons` pour récupérer la liste des pokémons. Ce endpoint est paginé, par défaut il retourne la liste des 10 premiers pokemons. Il est possible de changer de page en ajoutant le param `page` (par exemple `?page=2`), ou de changer le nombre de pokemons retournés en ajoutant le param `per_page` (par exemple `?per_page=25`)
- **POST** `/pokemons` pour créer un nouveau pokémon. Si les type1, type2 et generation ids existent et sont connus, il est possible de les passer tels quels dans la requête. S'il s'agit d'un nouveau type ou d'une nouvelle génération, le endpoint accepte les nested parameters.
  exemple:
  URL: http://localhost:3000/pokemons
  Request Type: POST
  Headers: Content-Type: application/json
  Body:

  ```json
  {
    "pokemon": {
      "number": 1,
      "name": "Fluffy",
      "hp": 45,
      "attack": 49,
      "defense": 49,
      "sp_atk": 65,
      "sp_def": 65,
      "speed": 45,
      "legendary": false,
      "type1": { "name": "Bois" },
      "type2": { "name": "Ciel" },
      "generation": { "number": 18 }
    }
  }
  ```

- **GET** `/pokemons/:id` pour obtenir les détails d'un pokémon spécifique
- **PUT/PATCH** `/pokemons/:id` pour mettre à jour un pokémon spécifique
- **DELETE** `/pokemons/:id` pour supprimer un pokémon spécifique

## Limitations

- Il n'y a pas d'authentification ni de système d'autorisations
- L'API ne prend pas en charge le téléchargement de fichiers ou d'images
- Il n'y a pas de système de versionnement de l'API
- Il n'y a pas de rate limit
- la pagination `per_page` n'est pas limitée
- Les pokemons retournés dans les réponses n'affichent pas le nom des types ou le numéro de génération, seulement leurs ids

## Prochaines étapes

- Afficher les noms de types et numéro de génération au lieu des ids
- Mettre en place un système d'authentification
- Docker pour faciliter le déploiement
- Support pour le téléchargement de fichiers ou d'images
- Ajouter plus de tests pour assurer une meilleure qualité de l'application
- Système de versionnement de l'API
