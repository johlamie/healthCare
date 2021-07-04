# HealthCare Documentation

HealthCare est une application destiné au grand public. Elle a pour but de permettre la prédiction d’attaques cardio-vasculaires, la surveillance des signes vitaux, d’alerter l’entourage en cas d’attaque cardiaque ou irrégularité cardiaque et aussi de signaler à l'utilisateur une possible maladie cardiaque.

## Introduction

HealthCare a été développée à l'aide de flutter et de dart. Il est possible de l'utiliser pour le moment que sur les smartphones sous IOS.
Pour pouvoir excuter ce projet, vous aurez besoin d'avoir les versions les plus réscentes de flutter et dart, Xcode, un simulateur d'appareil iOS et un compte google platefome (pour créer et récuperer une clé d'API si celle fournis n'est plus fonctionnelle).

Ne pouvant pas avoir accès à certaines données parce que les montres connectées disponible sur le marché ne permettre pas pour le moment d’avoir ces données, un simulateur a été mis en place pour simuler l’envoie des données. Ces données sont sauvegardées dans FireStore sur FireBase pour être ensuite utilisées.
L’enregistrement auprès des services de FireBase se fait depuis l’appareil mobile. L’utilisateur pourra se créer un compte, s’authentifier et renseigner les informations utiles et nécessaires. Une fois connecté et les différentes champs renseignées, l’utilisateur n’a plus rien à faire. Un algorithme en arrière-plan se charge de lire les données reçues du simulateur, de les stockées et d’effectuer les différents traitements. Les données reçues sont affichées afin que l’utilisateur puisse les consultées. Lorsque l’on détectera une crise cardiaque, le plus proche voisin est recherché afin de lui envoyer une notification. Lorsque celui-ci recevra la notification, il aura une page sur la carte google avec sa position, la position de la victime etle chemin à suivre pour s’y rendre. Une fois que la personne a été secouru, on le marque dans l'application afin de supprimer l'alerte.
Le schéma ci-dessous résume globalement l'architecture mise en place.

![image](https://user-images.githubusercontent.com/48968323/124392118-40123c80-dcf4-11eb-8aad-145b4505b7a1.png)


### Simulateur de données
Le répertoires dataSimulator contient le simulateur de données. A l'intérieur se trouve un fichier JavaScript nommé jsonToFireStore.js. Ce fichier va permettre de générer des données (fréqences cardiques, pression artérielle, Te-aux de cholestérol, glycemie, résultats électrocardiographiques au repos, dépression du segment St, pente du segment ST, nombre de vaisseaux principaux (0-3) colorés par la fluoroscopie). Un planificateur de tâches permet d'envoyer différentes données sur un interval de temps que l'on definit (definir la l'intervalle sur [Crontab](https://crontab.guru/)) .  Ces données sont stockés dans FireBase pour ensuite permettre de les lire et de les envoyées à l'IA.

#### Lancer le simulateur
Pour lancer le simulateur, il faut se placer dans le repertoire 'dataSimulator' et exécuté la ligne de commande suivante : 
```
node jsonToFireStore.js
```
<img width="570" alt="Capture " src="https://user-images.githubusercontent.com/48968323/124392107-31c42080-dcf4-11eb-99db-8b75bde313a4.png">


### Application HealthCare

Les repertoires principaux et fichiers utilisés pour la conception de l'application sont : 
- ios\ : contient les configurations et demandes d'autorisation nécéssaire pour l'iphone
  - *.gpx : Fichiers contenant des coordonnées géographiques pour changer la localistion de l'iphone
- lib\ : contient le code de constructions de l'applications(services et pages)
  - components\ : contient des classes et widgets crées (bouton, liste d'affichage...)
  - Screens\ : contient le code de création des différentes pages
  - main.dart : classe main qui lance l'application
  - constants.dart : contient les couleurs primaires à utilisers par défault pour le thème de l'application
- pubspec.yaml : contient les packages utilisés dans l'application

#### Exécuter l'application

il faut se placer dans le repertoire 'dataSimulator' et exécuter la ligne de commande suivante : 
```
flutter run
```
Une fois l'application lancer, il fait accepter la demande d'authorisation d'envoie de notification pour être alerter lorsqu'une personne est victime d'une attaques cardiaques à proximité.

<img  width="200" src="https://user-images.githubusercontent.com/48968323/124393187-89b15600-dcf9-11eb-896c-ab9720f102e4.png">

On est ensuite redirigé sur la page d'acceuil où il faut s'incrire puis se connecter pour avoir accès à la Home page.

<img  height="400" src="https://user-images.githubusercontent.com/48968323/124393904-13aeee00-dcfd-11eb-9b09-45a1d405c991.png">

Une seconde authorisation (pour la localisation) est nécessaire pour avoir accès à la page d'acceuil qui va afficher les données.

<img  width="400" src="https://user-images.githubusercontent.com/48968323/124396002-79a07300-dd07-11eb-93d1-5fba5a15cfd8.png">

Il faut ensuite acceder au drawer, et cliquer sur l'img du compte (par défaut c'est le logo) puis éditer ses informations de compte pour sauvergarder sa civilité, nom, prénom et date de naissance. Depuis cette page on pet également se déconnecter.

<img  height="400" src="https://user-images.githubusercontent.com/48968323/124395346-f0d40800-dd03-11eb-9b73-34ab19d94f35.png">

Le drawer permet aussi d'accéder à la page de soumission de données complémentaire afin d'envoyer les données au modèle de machine Learning et l'executer.

<img  width="200" src="https://user-images.githubusercontent.com/48968323/124395368-0c3f1300-dd04-11eb-93d1-cd61a1cfab74.png">

Si une personne à une crise cardique, la personne la plus proche reçoit une notification et peut lui venir en aide.

<img  width="200" src="https://user-images.githubusercontent.com/48968323/124399486-1705a200-dd1c-11eb-8d6a-5246377f3c20.png">


### Stockage des données
Les données sont stockées sur FireStore. Firestore est une base de données NoSQL orientée document. Contrairement à une base de données SQL, il n'y a pas de tables ou de lignes. Au lieu de cela,les données sont stockées dans des documents , qui sont organisés en collections. Tous les documents doivent être conservés dans des collections. Chaque document contient un ensemble de paires clé-valeur et peuvent aussi contenir des sous-collections et des objets imbriqués. [Mieux Comprendre le système de stockage dans Firestore ici](https://firebase.google.com/docs/firestore/data-model).

#### Base de données
il faut savoir que à chaque création de compte, un identifiant unique appelé 'uid' pour le compte. Cet uid sera utiliser comme une sorte de clé étrangères pour lier les informations stockées à l'utilisateur courant. Neuf (09) collections utilisées pour ce projet :

- User : Stocke les informations de base des utilisateurs
- UserLocalisation : Stocke la localisation des utilisateurs
- Contact : Contact d'urgence de l'utilisateur
- Data : Stocke recupérer issu du simulateur pour chaque utilisateur
- heartRateSimulation : Stocke temporairement la fréquence cardiaque issu du simulateur
- heartRate : Stocke les fréquences cardiaques de chaque utilisateurs
- heartAttackSignal : Stocke le signal, permettant de lancer l'alerte en cas de crises et de preveir le plus prôches voisin.
- watchSimulation : Stocker temporairement les données simulées 
- SubmitMLData : stocke les données à envoyer au modèle de machine learning

Pour avoir un aperçu plus large de la manière dont sont stockées les données, voir le [code service de gestion de base de données](https://github.com/johlamie/healthCare/blob/main/lib/components/services/database.dart).



### Version des technos et lib utilisés

- [firebase_core](https://pub.dev/packages/firebase_core) : "^0.7.0" 
- [firebase_auth](https://pub.dev/packages/firebase_auth) : "^0.20.1"
- [cupertino_icons](https://pub.dev/packages/cupertino_icons) : ^1.0.2
- [flutter_svg](https://pub.dev/packages/flutter_svg) : ^0.21.0+1
- [health](https://pub.dev/packages/health) : ^3.0.5
- [custom_navigation_bar](https://pub.dev/packages/custom_navigation_bar) : ^0.8.1
- [cloud_firestore](https://pub.dev/packages/cloud_firestore) : ^0.16.0+1
- [date_field](https://pub.dev/packages/date_field) : ^1.0.5
- [provider](https://pub.dev/packages/provider) : ^5.0.0
- [geolocator](https://pub.dev/packages/geolocator) : ^6.2.1
- [firebase_ml_custom](https://pub.dev/packages/firebase_ml_custom) : ^0.2.0+1
- [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications) : ^4.0.1+2
- [google_maps_flutter](https://pub.dev/packages/google_maps_flutter) : ^2.0.6
- [flutter_polyline_points](https://pub.dev/packages/flutter_polyline_points) : ^0.2.4
- [dio](https://pub.dev/packages/dio) : ^3.0.10
- [node-schedule](https://www.npmjs.com/package/node-schedule) : planificateur de tâches (utiliser dans le simulateur)


## IA
Pour ce qui est du modèle utilisé, on a un réseau de neurones assez basic avec en entrée le nombre de variables dans le jeu de données (14), 2 sous couches cachés de 512 neurones chacune et un neurone sur la couche de sortie.

```python
mlp_model = Sequential()

#First Hidden Layer
mlp_model.add(Dense(512, activation='relu', name='hidden_layer_1', input_dim = X.shape[1]))

#Second  Hidden Layer
mlp_model.add(Dense(512, activation='relu', name='hidden_layer_2'))

#Output Layer
output = mlp_model.add(Dense(1, activation='sigmoid', name='predictions_output'))
```
<img  width="425" src="https://user-images.githubusercontent.com/48968323/124398902-7d88c100-dd18-11eb-80a9-f9e80a049a01.png">

Performance du modèle : 

<img  width="500" src="https://user-images.githubusercontent.com/48968323/124399086-8ded6b80-dd19-11eb-89f3-0b532d6d93f7.png">


## Versions des langages
- Tensorflow : 2.5.0
- python : 3.7
- Flutter : 2.6
- Dart :2.12.3

<img  width="200" src="">


