# HealthCare Documentation

HealthCare est une application destinée au grand public. Elle a pour but de permettre la prédiction d’attaques cardio-vasculaires, la surveillance des signes vitaux, d’alerter l’entourage en cas d’attaque cardiaque ou irrégularité cardiaque et aussi de signaler à l'utilisateur une possible maladie cardiaque.

Vidéo de démonstration disponible ici : https://youtu.be/Ypvurwf4yu4

## Introduction

HealthCare a été développée à l'aide de flutter et de dart. Il est possible de l'utiliser pour le moment que sur les smartphones sous IOS.
Pour pouvoir exécuter ce projet (l'application mobile sur un simulateur ios), vous aurez besoin d'avoir les versions les plus récentes de flutter et dart, Xcode, un simulateur d'appareils iOS et un compte google platefome (pour créer et récupérer une clé d'API si celle fournis n'est plus fonctionnelle).

Ne pouvant pas avoir accès à certaines données parce que les montres connectées disponibles sur le marché ne permettent pas pour le moment d’avoir accès à certaines données, un simulateur a été mis en place pour simuler l’envoi des données. Ces données sont sauvegardées dans FireStore sur FireBase pour être ensuite utilisées.
L’enregistrement auprès des services de FireBase se fait depuis l’appareil mobile. L’utilisateur pourra se créer un compte, s’authentifier et renseigner les informations utiles et nécessaires. Une fois connecté et les différentes champs renseignées, l’utilisateur n’a plus rien à faire. Une routine en arrière-plan se charge de lire les données reçues du simulateur, de les stocker et d’éffectuer les différents traitements. Les données reçues sont affichées afin que l’utilisateur puisse les consulter. Lorsque l’on détectera une crise cardiaque, le plus proche voisin est recherché afin de lui envoyer une notification. Lorsque celui-ci recevra la notification, un écran contenant une carte Google s'affichera avec sa position, la position de la victime et le chemin à suivre pour s’y rendre. Une fois que la personne a été secouru, il faut le signaler dans l'application afin de supprimer l'alerte.
Le schéma ci-dessous résume globalement l'architecture mise en place.

<img width="570" alt="Capture " src="https://user-images.githubusercontent.com/48968323/124467094-adc37480-dd97-11eb-918d-c1f588d5a898.png">


### Simulateur de données
Le répertoire "dataSimulator" contient le simulateur de données. A l'intérieur se trouve un fichier JavaScript nommé "jsonToFireStore.js". Ce fichier permet de générer des données (fréquences cardiaques, pression artérielle, Te-aux de cholestérol, glycémie, résultats électrocardiographiques au repos, dépression du segment St, pente du segment ST, nombre de vaisseaux principaux (0-3) colorés par la fluoroscopie). Un planificateur de tâches permet d'envoyer ces différentes données sur un intervalle de temps que l'ont definit (definir l'intervalle sur [Crontab](https://crontab.guru/)) .  Ces données sont stockés dans FireBase pour ensuite permettre de les lire et de les envoyées à l'IA.

#### Lancer le simulateur
Pour lancer le simulateur, il faut se placer dans le répertoire "dataSimulator" et exécuté la ligne de commande suivante : 
```
node jsonToFireStore.js
```
Une fois lancer, à chaque écriture il y a un retour dans le terminal pour indiquer que les données ont été correctement envoyées.
AVANT ENVOIE : 

<img width="570" alt="Capture " src="https://user-images.githubusercontent.com/48968323/124392107-31c42080-dcf4-11eb-99db-8b75bde313a4.png">

APRES ENVOIE : 

<img width="570" alt="Capture " src="https://user-images.githubusercontent.com/48968323/124402605-a5d0e980-dd31-11eb-8c0f-518128c45323.png">


### Application HealthCare

Les répertoires principaux et fichiers utilisés pour la conception de l'application sont : 
- ios\ : contient les configurations et demandes d'autorisation nécessaire pour l'iphone
  - *.gpx : Fichiers contenant des coordonnées géographiques pour changer la localisation de l'iphone
- lib\ : contient le code de constructions de l'application (services et pages)
  - components\ : contient des classes et widgets créés (bouton, liste d'affichage...)
  - Screens\ : contient le code de création des différentes pages
  - main.dart : classe main qui lance l'application
  - constants.dart : contient les couleurs primaires à utilisers par défault pour le thème de l'application
- pubspec.yaml : contient les packages utilisés dans l'application

#### Exécuter l'application

il faut se placer à la racine du projet et exécuter la ligne de commande suivante : 
```
flutter run
```
Une fois l'application compilée et lancée il faut accepter la demande d'autorisation d'envoi de notification pour être alerté lorsqu'une personne est victime d'une attaque cardiaque à proximité.

<img  width="200" src="https://user-images.githubusercontent.com/48968323/124393187-89b15600-dcf9-11eb-896c-ab9720f102e4.png">

On est ensuite redirigé sur la page d'accueil où il faut s'inscrire puis se connecter pour avoir accès à la page d'acceuil.

<img  height="400" src="https://user-images.githubusercontent.com/48968323/124393904-13aeee00-dcfd-11eb-9b09-45a1d405c991.png">

Une seconde autorisation (pour la localisation) est nécessaire pour avoir accès à la page d'accueil qui va afficher les données.

<img  width="400" src="https://user-images.githubusercontent.com/48968323/124396002-79a07300-dd07-11eb-93d1-5fba5a15cfd8.png">

Il faut ensuite accéder au drawer, et cliquer sur l'image du compte (par défaut c'est le logo) puis éditer ses informations de compte (civilité, nom, prénom et date de naissance). Depuis cette page on pet également se déconnecter.

<img  height="400" src="https://user-images.githubusercontent.com/48968323/124395346-f0d40800-dd03-11eb-9b73-34ab19d94f35.png">

Le drawer permet aussi d'accéder à la page de soumission de données complémentaires afin d'envoyer les données au modèle de machine Learning et l'exécuter.

<img  width="200" src="https://user-images.githubusercontent.com/48968323/124395368-0c3f1300-dd04-11eb-93d1-cd61a1cfab74.png">

Après l'exécution du modèle, il y a une redirection sur une page de prédiction afin de conseiller à l'utilisateur de voir un médecin ou lui notifier qu'il y'a eu aucune anomalie détectée.

<img  width="200" src="https://user-images.githubusercontent.com/48968323/124480200-4f9e8d80-dda7-11eb-9adc-6dc6db0cfc6e.png">

Si une personne a une crise cardiaque, la personne la plus proche reçoit une notification et peut lui venir en aide. Il faut savoir qu'une crise cardiaque survient quand l’apport en sang riche en oxygène est interrompu dans le muscle cardiaque. Si le cœur ne reçoit pas assez de sang, et par conséquent d’oxygène, pendant plus de 20 minutes, une partie du muscle cardiaque (le myocarde) meurt, causant des dommages permanents. Pour simuler des attaques cardiaques, on va considérer que le sang ne circule plus ou très faiblement ce qui induit une réduction de la fréquence cardiaque. Lorsque celle-ci sera inférieur à 20, on alertera la personne la plus proche. Lorsque l'utilisateur n'a plus sa montre, il n'est pas possible d'avoir des données, donc on ne met pas à jour le champs stockant la fréquence cardiaque.

<img  width="450" src = "https://user-images.githubusercontent.com/48968323/124462163-b913a180-dd91-11eb-8c74-307affa21b52.JPG">

Carte

<img  width="200" src="https://user-images.githubusercontent.com/48968323/124399486-1705a200-dd1c-11eb-8d6a-5246377f3c20.png">


### Stockage des données
Les données sont stockées sur Firestore. Firestore est une base de données NoSQL orientée document. Contrairement à une base de données SQL, il n'y a pas de tables ou de lignes. Au lieu de cela, les données sont stockées dans des documents, qui sont organisés en collections. Tous les documents doivent être conservés dans des collections. Chaque document contient un ensemble de paires clé-valeur et peuvent aussi contenir des sous-collections et des objets imbriqués. [Mieux Comprendre le système de stockage dans Firestore ici](https://firebase.google.com/docs/firestore/data-model).

#### Base de données
Il faut savoir qu'à chaque création de compte, un identifiant unique appelé "uid" est attribué au compte. Cet uid sera utilisé comme une sorte de clé étrangère pour lier les informations stockées à l'utilisateur courant. Neuf (09) collections sont utilisées pour ce projet :

- User : stocke les informations de base des utilisateurs
- UserLocalisation : stocke la localisation des utilisateurs
- Contact : stocke les contacts d'urgences de l'utilisateur
- Data : stocke les données issues du simulateur pour chaque utilisateur
- heartRateSimulation : stocke temporairement la fréquence cardiaque issue du simulateur
- heartRate : stocke les fréquences cardiaques de chaque utilisateur
- heartAttackSignal : stocke le signal, permettant de lancer l'alerte en cas de crises et de prévenir le plus prôche voisin.
- watchSimulation : stocke temporairement les données simulées de la montre
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
Pipeline d’implémentation de l’IA :
-	Implémentation du module, sauvegarde, conversion et déploiement dans ML Kit de FireBase ;
-	Appel du model dans l’application mobile ;
-	Collecte de données, pour un enrichissement du dataset et une mise à jour continue du modèle ;
-	Analyse et affichage des données dans l’application ;
-	Mise à jour et redéploiement du modèle dans l'application.

![image](https://user-images.githubusercontent.com/48968323/124401968-35c06480-dd2d-11eb-800a-6cf0c851b177.png)

Le Dataset utilisé est un dataset multivarié disponible ici (https://archive.ics.uci.edu/ml/datasets/Heart+Disease). Il contient 76 attributs, mais toutes les expériences (modèles testés) se réfèrent à l'utilisation d'un sous-ensemble de 14 d'entre eux :

- âge : l’âge en année
- sexe : sexe (1 = masculin ; 0 = féminin)
- cp : type de douleur thoracique (angine typique, atypique, douleur non angineuse, asymptomatique)
- trestbps : tension artérielle au repos (en mm Hg à l'admission à l'hôpital)
- chol : cholestérol sérique en mg/dl
- fbs : (glycémie à jeun > 120 mg/dl) (1 = vrai ; 0 = faux)
- restecg : résultats électrocardiographiques au repos ( 0 = normal, 1 = anomalie de l’onde ST-T, 2 = montre une hypertrophie gauche probable) 
- thalach : fréquence cardiaque maximale atteinte
- exang : angine d'effort (1 = oui ; 0 = non)
- oldpeak : dépression du segment ST induite par l'exercice par rapport au repos
- Pente : Pente du segment ST à l'exercice de pointe (0 = montante, 1 = plat, 2 = descente)
- ca : nombre de vaisseaux principaux (0-3) colorés par la fluoroscopie
- thal : Trouble sanguin (3 = normal; 6 = défaut corrigé ; 7 = défaut réversible)
- num : diagnostic de maladie cardiaque ( 0 = rétrécissement de diamètre <50%, 1 = rétrècissement de diamètre >50%)



Pour ce qui est du modèle utilisé, on a un réseau de neurones assez basique avec en entrée le nombre de variables dans le jeu de données (14), 2 sous-couches cachées de 512 neurones chacune et un neurone sur la couche de sortie. 

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

### Retour d'autres modèles testés
![image](https://user-images.githubusercontent.com/48968323/124402049-ddd62d80-dd2d-11eb-87f8-c1c7524859c6.png)


## Versions des langages
- Tensorflow : 2.5.0
- python : 3.7
- Flutter : 2.6
- Dart :2.12.3

<img  width="200" src="">


