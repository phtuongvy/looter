# Looter

### Exercice 1

- Il manque un identifiant parce que les arguments de List sont obligés d'être uniques. C'est le principe du protocole Identifiable.

### Exercice 2

- On a ajouté un component Button qui utilise la fonction addLoot() et un boucle ForEach.

- On a utilisé un ForEach parce que cela permet de mettre à jour facilement les items quand la valeur change. Son rôle est de créer un view pour chaque item dans le loop. On a séparé le bouton du ForEach pour éviter qu'il crée plusieurs boutons.

### Exercice 3

- Le code ne fonctionne pas, parce que self est immutable.
- Après l'ajout du @State, maintenant fonctionne car @State permet d'effectuer un changement d'état à id: self.

## Ajout un item

### Exercice 1 et exercice 2

- Quand on clique sur "Action", ça ne ajoute pas de nouveau item. Cela ne marche pas parce que il manque de mettre de Observable Object, @StateObject et @Published vu que maintenant Inventory est devenue une classe. Et que Observable Object rend la classe utilisable dans un view. @Published permet d'avoir des rechargements de la valeur de la classe dans la view. @StateObject permet de créer des instances de mon objet.

- J'ai ce message d'erreur : 
ForEach<Array<String>, String, Text>: the ID Magie de feu occurs multiple times within the collection, this will give undefined results!

Parce que L'ID de l'item du boucle ForEach<Array<String> se duplique plusieurs fois avec même valeur, cela va donner des résultats undéfinis.
