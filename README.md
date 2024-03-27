# CodePilot

## Table des Matières

- [CodePilot](#codepilot)
  - [Table des Matières](#table-des-matières)
  - [Description](#description)
    - [Fonctionnalités](#fonctionnalités)
    - [Maquettes d'interfaces (UI/UX)](#maquettes-dinterfaces-uiux)
    - [Plateformes Supportées (prévues)](#plateformes-supportées-prévues)
  - [Installation](#installation)
    - [Compiler depuis le code source](#compiler-depuis-le-code-source)
    - [Télécharger la dernière version](#télécharger-la-dernière-version)
  - [Projet](#projet)
    - [Sujet donné](#sujet-donné)
    - [Choix du projet](#choix-du-projet)
    - [Technologies Utilisées](#technologies-utilisées)
    - [Inspirations](#inspirations)
    - [Rendus](#rendus)
    - [Membres du Groupe](#membres-du-groupe)

![CodePilot Logo](/github_assets/logo/logo.png)

---

## Description

CodePilot est un jeu éducatif interactif conçu pour faciliter l'apprentissage de l'algorithmique. En programmant une voiture pour naviguer sur un graphe qui représente une route, les joueurs affrontent des défis algorithmiques de difficulté croissante. Le jeu se distingue par une progression pédagogique qui initie les joueurs aux bases de l'algorithmique avant de les confronter à des niveaux générés aléatoirement pour un défi continu.

### Fonctionnalités

- **Progression Pédagogique :** Débute avec des niveaux manuels pour une introduction douce aux concepts d'algorithmique, progressant vers des défis générés procéduralement pour une complexité accrue.
- **Défis d'Algorithmique :** Les niveaux demandent aux joueurs de résoudre des problèmes algorithmiques variés, en utilisant des instructions de programmation pour contrôler leur véhicule sur le graphe.
- **Génération Procédurale :** Les niveaux avancés sont générés de façon aléatoire, offrant une rejouabilité et des défis uniques à chaque partie.
- **Système d'Évaluation :** Les solutions sont évaluées selon leur efficacité (nombre de lignes et vitesse d'execution), récompensant les joueurs avec des étoiles pour les niveaux maîtrisés.

### Maquettes d'interfaces (UI/UX)
![Maquette PC - Ingame](/github_assets/mockups/images/PC/PC%20-%20Ingame.png)
![Maquette PC - Level completed](/github_assets/mockups/images/PC/PC%20-%20Level%20completed.png)

[➡ Voir toutes les maquettes](/github_assets/mockups/mockups.md)

### Plateformes Supportées (prévues)
- **PC** (Windows en priorité, Linux et macOS facultatifs)
- **Android** (facultatif)
    - Support de la réalité augmentée (facultatif)
- **Web** (facultatif)

---

## Installation

### Compiler depuis le code source

Pour jouer à CodePilot, suivez ces instructions simples :

1. Téléchargez et installez Godot Engine 4 depuis le [site officiel](https://godotengine.org/download/4.x/).
2. Clonez le dépôt GitHub : ```git clone https://github.com/CodePilotIUT/CodePilot.git```
3. Ouvrez le projet dans Godot et lancez-le directement depuis l'éditeur pour démarrer le jeu.

### Télécharger la dernière version

Vous pouvez télécharger la dernière version de CodePilot depuis la [page de releases](https://github.com/CodePilotIUT/CodePilot/releases) du dépôt GitHub.

---

## Projet

**Ce projet est réalisé dans le cadre du projet [SAÉ](https://fr.wikipedia.org/wiki/Situation_d%27apprentissage_et_d%27%C3%A9valuation) S4.A.01 "Développement d’une application complexe" du semestre 4 de la formation [BUT Informatique](https://www.iut-orsay.universite-paris-saclay.fr/formations/but/but_informatique) de l'[IUT d'Orsay](https://www.iut-orsay.universite-paris-saclay.fr/).**

### Sujet donné

> Vous devez réaliser un jeu sérieux dédié à l'apprentissage des mathématiques, pour des élèves de tout niveau, de l'élémentaire à l'université. Le but est peut être de faciliter les apprentissages ou d'illustrer un concept mathématiques, en s'appropriant ces concepts tout en jouant.
> 
> Cela doit être un jeu interactif, et ne peut être seulement un QCM, puisque qu'on vous demande que l'élève puisse apprendre en s'amusant, en supposant que s'amuser permet d'augmenter la motivation et l'efficacité de l'apprentissage.

### Choix du projet

Nous avons choisi de réaliser un jeu éducatif sur l'algorithmique, car c'est un domaine des mathématiques qui est souvent difficile à appréhender pour les débutants.

### Technologies Utilisées

- **Moteur de Jeu :** [Godot Engine 4](https://godotengine.org/download/4.x/) *(moteur de jeu gratuit et open-source ([MIT License](https://godotengine.org/license/)))*
    - Choisi pour sa simplicité d'utilisation, sa flexibilité et sa compatibilité multiplateforme
- **Langage de Programmation :** [GDScript](https://docs.godotengine.org/fr/stable/tutorials/scripting/gdscript/gdscript_basics.html) *(langage de script de Godot Engine basé sur Python)*
    - Choisi pour sa simplicité et sa compatibilité avec Godot Engine

### Inspirations
- **[Human Resource Machine](https://store.steampowered.com/app/375820/Human_Resource_Machine/):** Jeu vidéo de programmation avec de l'algorithmique bas niveau proche de l'assembleur.
- **[while True: learn()](https://store.steampowered.com/app/619150/while_True_learn/):** Jeu vidéo éducatif sur la construction de systèmes d'IA avec du code visuel.
- **[Advent of Code](https://adventofcode.com/):** Challenges de programmation sous forme de calendrier de l'avent.
- **[Scratch](https://scratch.mit.edu/):** Plateforme éducative pour créer des jeux avec un langage visuel pour les enfants.

### Rendus
[➡ Voir les rendus du projet](/github_assets/rendus/rendus.md)

### Membres du Groupe

- **Alexandre Malfreyt** ( [GitHub](https://github.com/AlexZeGamer) | [LinkedIn](https://www.linkedin.com/in/alexandre-malfreyt/) | [Site Web](https://alexandre.malfre.yt/) )
- **Lucas Monnier** ( [GitHub](https://github.com/LuKun14) | [LinkedIn](https://www.linkedin.com/in/lucas-monnier-1a8348241/) )
- **Baptiste Rey** ( [GitHub](https://github.com/orgs/CodePilotIUT/people/Baptistery) | [LinkedIn](https://www.linkedin.com/in/baptiste-rey-15606b270/) )
