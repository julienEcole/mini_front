# Mini Front Flutter App

Ce projet est un exemple d'application Flutter utilisant le pattern BLoC et un faux data source pour afficher, créer et modifier des posts. Il s'agit d'un mini-projet pédagogique.

## Fonctionnalités

- **Affichage de la liste des posts** : Récupère une liste de posts depuis une source de données factice (FakePostsDataSource) et les affiche.
- **Création de posts** : Permet de créer un nouveau post et de l'ajouter à la liste.
- **Détail et modification des posts** : Affiche un écran de détail pour chaque post, permettant de modifier son titre et sa description.

## Structure du projet

- **`lib/main.dart`** : Point d'entrée de l'application. Configure le `BlocProvider` pour le `PostBloc` et définit les routes (`/post_detail`, `/create_post`).
- **`lib/models/post_entity.dart`** : Définition du modèle `Post` (id, title, description).
- **`lib/datasources/`** : Contient le `PostsDataSource` (contrat) et une implémentation factice `FakePostsDataSource` pour simuler un backend.
- **`lib/repositories/posts_repository.dart`** : Abstraction du data source, fourni au BLoC.
- **`lib/bloc/`** : Contient le `PostBloc`, ses `PostEvent` et `PostState`, gérant la logique métier (chargement, création, mise à jour des posts).
- **`lib/screen/`** : Contient les différentes pages de l'application :
  - `posts_list_screen.dart` : Affiche la liste des posts et un bouton pour créer un nouveau post.
  - `create_post_screen.dart` : Écran pour créer un nouveau post.
  - `post_detail_screen.dart` : Écran pour afficher et modifier un post existant.

## Installation et Lancement

1. **Cloner le dépôt** :

   ```bash
   git clone https://github.com/julienEcole/mini_front.git
   cd mini_front

2. **Installer les dépendances** :

    ```bash
    flutter pub get

Assurez-vous d'avoir Flutter installé. Puis, dans le répertoire du projet :

3. **Lancer l\'application :**

    ```bash
    flutter run

Choisissez l\'appareil (simulateur, émulateur ou web) si nécessaire.

## Navigation

- L\'écran principal affiche la liste des posts.
- Taper sur un post dans la liste pour accéder à son détail et pouvoir le modifier.
- Appuyer sur le bouton flottant (icône "+") pour accéder à l'écran de création d'un nouveau post.