---
layout: post
author: Yannick
title:  "Comment j'ai continué Python avec Pyside 2"
description: "coronavirus confinement developpement apprendre python"
lang: fr
date:   2020-04-19 10:00:00 +0100
categories: [dev, story]
comments: true
---

Je comptais écrire toutes les deux semaines mais visiblement le temps passe bien plus vite qu’il n’y parait. Depuis, j’ai bouclé la formation complète Python Docstring et démarré une nouvelle course pour créer des applications avec Qt for Python.

Une fois les 40 chapitres engloutis, les derniers permettent de les mettre en pratique avec deux projets : un convertisseur de devises et un ciné club. Cette fois, il n'est pas question d'interagir avec le terminal, que nenni Monsieur, place à **Qt for Python**. J'y reviendrais un peu plus bas, mais Qt va ici nous permettre de réaliser une interface graphique et de rendre le code cross-platform avec la librairie **Fbs**.

Sur les deux projets, la structure est relativement simple : une partie API et une partie front réalisée quant-à elle avec la bibliothèque Qt for Python (PySide 2). Cette dernière, bien que puissante, n’est pas aussi facile que ça à prendre en main de part la nomination des widgets et méthodes associées; Surement le temps de mettre le pied à l’étrier. C’est pourquoi une fois cette formation terminée, j’ai souhaité en apprendre davantage sur cette bibliothèque en démarrant la formation [**Créer 5 applications de bureau avec Qt for Python**](https://www.docstring.fr/formations/creer-5-applications-de-bureau/).

Qt for Python permet de créer des applications pouvant s’exécuter sur toutes les plateformes (Windows, MacOs, Linux). La librairie se base sur des widgets pouvant s’ajouter à notre application (QPushButton, QTextEdit, QTabWidget...), on peut les connecter avec notre API assez facilement et même améliorer leurs apparences... Avec du CSS ! Cerise sur le gâteau, pour déployer l’application sur chaque système, il est possible de faire un build de l’application pour l’exécuter sur votre machine (sur Windows on aura un .exe, MacOs un .dmg et pour Linux un .deb) et de créer par la même occasion un installeur (avec la commande *fbs installer*), grâce à la librairie FBS (Fman Build System). Alors, ça vous branche toujours pas ?

Pour ma part, je trouve cette techno plutôt séduisante et la formation permet de s’en faire une idée en créant : 

- Un gestionnaire de notes
- Un lecteur de vidéos
- Un explorateur de fichiers
- Un convertisseur d’images
- Un gestionnaire de tâches

Switchant entre cette formation et *«Python par la pratique : 101 Exercices Corrigés»* afin d’aiguiser mes nouvelles connaissances *Pythonesque*, je n’ai pu faire que l’application d’échauffement (Warmup) et le gestionnaire de notes. La partie concernant uniquement Qt commence à s'éclaircir dans mon esprit, il faut tout de même s’accrocher et ne pas hésiter à retourner en arrière pour comprendre le code que nous enseigne Thibault.

J’ai déjà hâte de continuer et de terminer cette course avec déjà une petite idée d’application pour mettre en oeuvre ce que j’aurai acquis durant ces quelques heures. Si vous êtes intéréssés par Python et par ce qu'il est possible de faire avec, je vous invite fortement à vous rendre sur le site [Docstring](https://www.docstring.fr/).