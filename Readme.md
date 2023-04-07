Soit la base de données « Gestion des salles de sport »dont le schéma relationnel est donné ci‐ dessous :
VILLES (VILLE)
SPORTIFS (IDSPORTIF, NOM, PRENOM, SEXE, AGE, IDSPORTIFCONSEILLER*)
SPORTS (IDSPORT, LIBELLE)
GYMNASES (IDGYMNASE, NOMGYMNASE, ADRESSE, VILLE*, SURFACE)
ARBITRER (IDSPORTIF*, IDSPORT*)
ENTRAINER (IDSPORTIFENTRAINEUR*, IDSPORT*)
JOUER (IDSPORTIF*, IDSPORT*)
SEANCES (IDGYMNASE*, IDSPORT*, IDSPORTIFENTRAINEUR*, JOUR, HORAIRE, DUREE)
Dans ce schéma :  
⎯ Les clés primaires sont soulignées et * représente une clé étrangère.
⎯ Les attributs commençant par ID sont des entiers.
⎯ Les attributs SEXE, ADRESSE, Ville sont des chaines de caractères
⎯ Le JOUR est une chaîne de caractères prise dans le domaine {’Samedi’,…,  ’Vendredi’}.
⎯ L’attribut SEXE est une chaîne de caractères prise dans le domaine {’M’, ‘F’}.
⎯ La durée est en minute.
⎯ Horaire est un réel qui représente le début de la séance convertit en heure.  
Partie I : Modélisation orientée objet  
1. Transformez ce schéma relationnel en un schéma Objet (diagramme de classes)
Partie II : Création des TablesSpaces et  utilisateur
2. Créer deux TableSpaces   SQL3_TBS et  SQL3_TempTBS
3. Créer un utilisateur SQL3 en lui attribuant les deux tablespaces créés précédemment  
4. Donner tous les privilèges à cet utilisateur.
Partie III : Langage de définition de données
5. En se basant sur le diagramme de classes fait, définir tous les types nécessaires. Prendre en compte
toutes associations qui existent.  
6. Définir les méthodes permettant de  
- Calculer pour chaque sportif, le nombre des sports entrainés.
- Calculer le nombre de gymnases pour chaque sport.
- Calculer la superficie moyenne des gymnases, pour chaque ville.  
7. Définir les tables nécessaires à la base de données.
Partie VI : Langage de manipulation de données
8. Remplir toutes les tables par les instances décrites dans le fichier insert.sql en prenant en considération
les adaptations nécessaires.
Partie V : Langage d’interrogation de données
9. Quels sont les sportifs (identifiant, nom et prénom) qui ont un âge  entre 20 et 30 ans ?
10. Afficher la superficie moyenne des gymnases, pour chaque ville.
11. Quels sont les sportifs qui sont des conseillers ?
12. Quels entraîneurs n’entraînent que du hand ball ou du basket ball ?
13. Quels sont les sportifs les plus jeunes?