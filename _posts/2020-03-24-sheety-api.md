---
layout: post
author: Yannick
title:  "Sheety, l'api facile"
description: "hands on sheety api"
lang: fr
date:   2020-03-24 10:00:00 +0100
categories: [dev]
comments: true
---

Développer un front-end lorsque le back n'est pas encore fait, c'est souvent passer par des fichiers json pour simuler des appels vers l'api. Avec Sheety, plus besoin de se prendre la tête avec une collection de *dummy data* : une feuille Google Sheets et en avant Guimgamp !

# La Picsou App

Sheety vous propose de transformer votre feuille Google Sheets en véritable API REST, ce qui signifie que vous allez pouvoir réaliser des actions de type **post**, **put**, **get** et **delete** sans faire une seule ligne de code. Magique hein ? Allez, place à l'action !

Pour l'exemple, imaginons que je souhaite pouvoir noter mes dépenses quotidiennes dans une Google Sheets pour prévoir, maintenir un budget ou juste pour essayer Sheety. Ça serait relou de devoir se connecter à son compte Google, ouvrir Sheets puis sa feuille et enfin de mettre dans la bonne case le libellé, dans une autre une catégorie et enfin le prix. Ouais, relou.

Du coup, on va se faire une application web très très light en utilisant Sheety pour hydrater notre fichier sans l'ouvrir une seule fois. Et comme j'aime flingué la mouche au bazooka, on va utiliser Angular :D

# Let's get ready to rumble !

Je vais pas vous faire un tuto' pour utiliser Sheety, la doc est très bien faite et c'est plutôt intuitif. Ma feuille de mon côté est déjà prête, juste un petit test pour vérifier que tout est ok :

![terminal - appel api](/assets/images/sheety/terminal.png)

L'API nous renvoi bien notre première dépense, on est content ! Pourquoi mon id vaut 2 ? Car dans ma feuille Google Sheets j'ai conservé un header pour chaques colonnes afin de m'y retrouver, au cas où. Personnellement je trouve ça dommage que Sheety n'en prenne pas compte puisque notre feuille, en plus d'être l'API, elle est aussi notre base de donnée. Là, on a trois colonnes mais s'il devait y en avoir davantage ça pourrait vite devenir la *Scheiße*. 

# Sheety et Angular

Comme je le disais plus haut, l'idée est de faire une app qui va permettre d'ajouter simplement les dépenses du quotidien et là j'imaginais plutôt deux pages : 
- Une première avec un formulaire pour ajouter un libellé, le coût et sa catégorie
- Une seconde avec la liste des dépenses

Pour avoir un rendu minimaliste et rapide je vais utiliser la librairie **Angular Material** , ça va très bien faire l'affaire avec le composant **Tabs** pour avoir mes deux pages sous forme d'onglets.
Dans mon premier onglet j'aurai donc la liste des dépenses, là on va taper dans le composant **List**. 

![stackblitz - show expenses](/assets/images/sheety/show-expenses.png)

Dans le second on va mettre un formulaire piloté par le code avec les composants **Input** et **Select**. C'est tout ce qu'il nous faut. Je vous l'ai dis, on fait vite fait, bien fait.

![stackblitz - add expense](/assets/images/sheety/add-expense.png)

Pour ce qui est de l'envoi des données, il s'agit d'un service des plus classiques, tout pareil pour faire l'appel en **get**, je ne vais donc pas m'y attarder.

# Le bousin en action

![stackblitz - demo](/assets/images/sheety/demo.gif)

Je ne pourrais pas tromper votre sens aiguisé de l'observation en vous parlant de la fenêtre de droite ouverte avec la dite feuille Google Sheets qui se met à jour rapidement une fois l'action réalisée, preuve que Sheety carbure pas mal derrière. On pourrait aussi aller plus loin en filtrant sur les catégories lors de la récupération des dépenses, car oui, Sheety permet aussi d'ajouter des filtres dans l'url d'appel du genre :

![terminak - filtre](/assets/images/sheety/terminal-filtre.png)

# Le mot de la fin

Voilà, ainsi s'achève cette brève demo de Sheety, peut-être que ça peut en inspirer certains pour, je ne sais pas, une application complète (why not?), un *POC* rapidos ou juste pour le plaisir d'essayer.

Pour les plus curieux, je vous invite à tester par vous-même en créant juste votre compte Sheety ainsi que votre feuille Google Sheets (je vais quand même pas vous laisser pourrir la mienne :D). Le code est disponible sur Stackblitz juste [là](https://stackblitz.com/edit/try-sheety)
