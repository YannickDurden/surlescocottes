---
layout: post
author: Yannick
title:  "Développer sous Windows avec WSL"
description: "windows wsl linux ubuntu stack developpeur developpement web"
lang: fr
date:   2020-04-20 11:00:00 +0100
categories: [dev, feedback]
comments: true
---

Il peut y avoir plusieurs raisons de vouloir coder en restant sous Windows. Mais développer avec un environnement plus proche de celui de production, c'est largement préférable et c'est pourquoi j'ai fait le choix d'utiliser WSL.

On pourrait envisager une solution comme Docker ou encore VirtualBox, mais entre s'arracher les cheveux avec le premier (déjà qu'il ne m'en reste pas beaucoup) et configurer une machine virtuelle, perdre du temps avec des problèmes de synchronisation de fichiers et Jean-Passe, non merci. Une autre solution, bien moins connue à priori, c'est le Windows Subsystem for Linux - disponible directement depuis le Microsoft Store.

# C'est quoi WSL ?

Je ne ferais pas plus juste que la définition officielle :

<q> Le sous-système Windows pour Linux permet aux développeurs d’exécuter un environnement GNU/Linux (et notamment la plupart des utilitaires, applications et outils en ligne de commande) directement sur Windows, sans modification et tout en évitant la surcharge d’une machine virtuelle. </q>

Plutôt cool non ? Bon allez je vous montre !

Cela s'adresse à ceux qui ont Windows 10 bien entendu, alors rendez-vous dans le Store et dans la barre de recherche vous pouvez taper **Ubuntu**, vous installez le bousin et on est prêt. Au premier lancement, il va s'agir de configurer votre utilisateur, laissez-vous guider car pour le moment, rien de sorcier. Si vous rencontrez le moindre problème, je vous laisse jeter un oeil juste ici : [Initialisation d'une distribution nouvellement installée](https://docs.microsoft.com/fr-fr/windows/wsl/initialize-distro)

Et voilà ! Ubuntu installé en deux temps trois mouvements avec sa dernière version LTS.

![terminak - ubuntu 18](/assets/images/wsl/terminal.png)

# LAMP

Étant développeur php, il me fallait donc une pile lamp mais sans Apache vu que je compte utiliser le web server Symfony. En une ligne de commande on installe tout ce qu'il nous faut :

<div style="background-color: black; text-align: left; font-size: 12px; color: white;">
<code>
sudo apt install php mysql-server php-mysql
</code>
</div>

Une fois terminée, on relance une nouvelle ligne de commande pour ajouter quelques modules :

<div style="background-color: black; text-align: left; font-size: 12px; color: white;">
<code>
sudo apt install php-curl php-gd php-intl php-json php-mbstring php-xml php-zip
</code>
</div>

# Composer et Symfony

Qui dit Symfony, dit musique. Non ? Presque, Composer. Là je vous renvoi vers la [documentation officielle](https://getcomposer.org/download/), c'est juste du copier/coller. On vérifie quand même que ça se soit bien passé :

![terminak - composer](/assets/images/wsl/composer.png)

Cool ! On enchaîne avec l'installation de Symfony et on vérifie qu'il ne nous manque rien :

![terminak - symfony](/assets/images/wsl/symfony.png)

<img style="display: block; margin-left: auto; margin-right: auto;" src="https://media.giphy.com/media/DqZKCC1rRht8FmnKbv/giphy.gif">

# Intégration de WSL avec VS Code

L'avantage d'utiliser WSL c'est qu'on va pouvoir même coder avec Visual Studio Code sans toucher une seule configuration. Juste une précision pour ce point, il faut installer la commande **code** dans le path. Pour se faire, utiliser le raccourci *CMD + Shift + P* et dans la barre de recherche taper *path*. Vous devriez voir *Shell Command : install 'code' command in PATH*. That's it.

Je vais juste créer un projet Symfony avec la commande : 

<div style="background-color: black; text-align: left; font-size: 12px; color: white;">
<code>
symfony new my_website --full
</code>
</div>

On se rend ensuite dans le dossier fraîchement créé et dans le terminal on tape juste :

<div style="background-color: black; text-align: left; font-size: 12px; color: white;">
<code>
code .
</code>
</div>

La magie opère : VS Code s'ouvre dans Windows (à condition qu'il soit installé sur votre machine, c'est pas si magique que ça :D).
On va alors tester rapidement notre site : toujours dans notre terminal :

<div style="background-color: black; text-align: left; font-size: 12px; color: white;">
<code>
php bin/console make:controller
</code>
</div>

<div style="background-color: black; text-align: left; font-size: 12px; color: white;">
<code>
BuddyController
</code>
</div>

C'est immédiat, nos nouveaux fichiers apparaîssent dans l'éditeur. On relance le serveur et dans le navigateur on se rend sur l'url **http://127.0.0.1:8000/buddy** et on dit bonjour à notre Buddy.

![vs code et chrome](/assets/images/wsl/buddy.png)

# Base de données

Il me semble qu'avec la version 18 d'Ubuntu il n'est pas possible de se connecter directement à MySql depuis notre application, j'entend par là d'utiliser l'utilisateur *Root* ; Et puis c'est quand même plus propre d'avoir un utilisateur pour une base de donnée, ça peut éviter bien des erreurs. Alors on se fait ça :

![terminal - mysql](/assets/images/wsl/create_db_db_user.png)
<small>L'erreur à la création de l'utilisateur est normale, il existait déjà mais c'est juste pour afficher la commande</small>

Dans votre fichier **.env** il ne vous reste plus qu'à modifier les champs concernant la connection à la base de donnée. Achtung, j'ai modifié de mon côté le port MySql étant donné que j'ai aussi une installation sous Windows qui utilise le port 3306. Pour se faire :

<div style="background-color: black; text-align: left; font-size: 12px; color: white;">
<code>
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
</code>
</div>

### Client MySql

J'aime utiliser HeidiSql pour sa simplicité, alors pour se connecter à notre base, on a pas grand chose à mettre :

![HeidiSql](/assets/images/wsl/heidisql.png)

Rien de plus simple pour administrer vos base de données provenant d'Ubuntu. Si vous utilisez autre chose, comme MySql Workbench par exemple, la marche à suivre reste identique.

# Export WSL

Bon alors, vous avez vu ? Rien de compliquer pour installer WSL ;-)

L'avantage d'utiliser Docker ou une VM pour un projet, c'est que c'est facilement partageable avec toute personne travaillant sur le même projet que vous. Mais pas d'inquiétude, il nous est aussi possible de faire des exports de notre distribution pour distribuer la dite distribution. Ouais.

Ouvrer un Powershell en mode administrateur puis exécuter la commande suivante :

<div style="background-color: black; text-align: left; font-size: 12px; color: white;">
<code>
wsl --list --all
</code>
</div>
Cette commande va vous renvoyer les distributions présentes sur votre machine. Lançons maintenant l'export :

<div style="background-color: black; text-align: left; font-size: 12px; color: white;">
<code>
wsl --export Ubuntu ./SlcUbuntu.tar
</code>
</div>

Le premier argument correspond au nom de l'image, le second au nom que nous allons donner à notre export. Il est possible d'en spécifier un troisième qui sera le dossier où sera enregistré le fichier. La commande étant lancée depuis le Bureau, l'export sera donc ici.

# Import WSL

Pour importer l'image, c'est tout aussi simple que l'export. En revanche, je vais créer un dossier dans AppData afin d'y mettre ma nouvelle image. Toujours avec le Powershell en mode administrateur on lance les commandes suivantes :

<div style="background-color: black; text-align: left; font-size: 12px; color: white;">
<code>
mkdir ~/AppData/Local/slcUbuntu
wsl --import SlcUbuntu ~/AppData/Local/slcUbuntu ./SlcUbuntu.tar
</code>
</div>

Le premier argument correspond au nom que portera l'image, le second c'est le dossier où elle sera installée et le troisième c'est le fichier que nous avons créé précédement.

Si vous avez l'application **Terminal** installée sur Windows, alors il vous sera possible d'y accèder sur l'une ou l'autre depuis l'interface :

![Terminal windows](/assets/images/wsl/powershell.png)

# Le mot de la fin

Cela vous aidera peut-être à franchir le pas pour travailler avec un environnement Linux, ou même sans aller jusque là, juste avoir un environnement de développement qui correspond à votre environnement de production. Ici, j'ai fait le choix d'Ubuntu mais sur le Microsoft Store, il y a aussi Debian et bien d'autres mais je ne pense que vous en aurez l'usage pour du développement web (comme Kali Linux, plus accès sur la sécurité). J'expérimente d'ailleurs cette manière de coder aussi bien pour des projets persos que sur des projets professionnels et ça fait franchement le job.