-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 09 déc. 2024 à 12:23
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `e_change`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `img` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alt` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `publish_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_ibfk_1` (`user_id`),
  KEY `article_ibfk_2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `title`, `img`, `alt`, `content`, `publish_date`, `status`, `user_id`, `category_id`) VALUES
(40, 'Mise en place d\'une piscine hors sol', 'PiscineBois.webp', 'Une piscine en bois de 4m de large sur 6m de long devant une maison.', '<p>Avant de commencer l\'installation d\'une piscine hors sol il vous faudra au préalable préparer le terrain d\'installation d\'une piscine hors sol, il est essentiel de choisir un emplacement adéquat et de le rendre stable et nivelé. Voici les principales étapes pour bien préparer votre sol avant l’installation.</p>\r\n\r\n<p><strong>Choix de l\'emplacement :</strong> Optez pour une zone ensoleillée, éloignée des arbres pour minimiser les débris et à l’abri du vent. Prévoyez aussi un espace autour de la piscine pour faciliter la circulation et, éventuellement, l’installation de chaises longues ou d\'une terrasse. Assurez-vous que l’emplacement soit accessible à une source d’eau et à un branchement électrique pour les équipements nécessaires (filtration, par exemple).</p>\r\n\r\n<p><strong>Nivellement et préparation du sol :</strong> Si le terrain n\'est pas naturellement plat, il faudra le niveler. Utilisez un niveau à bulle pour vérifier l\'horizontalité. Dans les zones inclinées, vous pouvez rajouter du sable pour aplanir, ou envisager un léger terrassement si nécessaire. Il est important de retirer toutes les racines, pierres et débris qui pourraient endommager la piscine. Une dalle de béton est la solution la plus stable et durable, mais n’est pas indispensable pour toutes les piscines.</p>\r\n\r\n<p><strong>Mise en place d’un tapis de sol :</strong> Une fois le sol aplani, ajoutez un tapis de sol pour protéger le fond de la piscine, surtout si elle est placée directement sur la pelouse. Les tapis modulaires ou en mousse sont des options pratiques pour une bonne isolation et pour limiter l’usure de la base de la piscine.</p>', '2024-11-06 16:31:03', 1, 42, 39),
(41, 'Pourquoi mon robot de piscine ne monte plus aux parois ?', 'robotPiscine.webp', 'Robot de piscine pausé au bord de la piscine', 'Plusieurs facteurs peuvent être à l\'origine du problème. Voici quelques diagnostics à envisager pour identifier et résoudre cette panne :\r\n\r\n<p><strong>Problème de turbine ou de filtre encrassé :</strong> Si des débris comme de la poussière, des feuilles ou des cheveux bloquent la turbine, cela peut affecter la puissance d\'aspiration du robot et l\'empêcher de grimper les parois. Un nettoyage approfondi de la turbine et du filtre peut résoudre ce problème​.</p>\r\n\r\n<p><strong>Usure des accessoires de déplacement :</strong> Les chenilles ou les roues du robot peuvent s\'user avec le temps, ce qui diminue son adhérence aux parois. Si les brosses rotatives sont abîmées, cela peut également réduire la capacité du robot à grimper. Il est donc important de vérifier l\'état des chenilles et des brosses et de les remplacer si nécessaire​.</p>\r\n\r\n<p><strong>Réglage de la pression ou du système de filtration :</strong> Pour certains modèles, un mauvais réglage du système de filtration ou de la pression peut également être responsable du manque de puissance pour grimper les parois. Assurez-vous que votre système fonctionne correctement et qu\'il est bien réglé.</p>', '2024-11-06 23:28:17', 1, 42, 39),
(43, 'Comment changer ses bougies de préchauffage ?', 'bougiesPrechauffage.webp', 'Capot de la voiture ouvert avec vue sur les bougies et cliquet sur la bougie de préchauffage prêt à être dévissé', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aut, soluta! Ex fuga laboriosam, optio consequuntur officiis quidem dolorum atque non soluta, quibusdam tenetur illum quis laudantium perferendis incidunt eligendi voluptatibus.\r\nAdipisci cupiditate pariatur voluptatem dolorum voluptas harum provident cumque facilis, ullam tempore a saepe distinctio. Quod placeat asperiores deleniti? Incidunt illum, temporibus odit dolorem voluptatibus minus fugiat nobis consequuntur soluta.</p>\r\n\r\n<p>Repudiandae, dolor impedit. Aspernatur temporibus sunt, explicabo provident sapiente enim voluptatum amet, unde obcaecati, vero ipsam! Officia deleniti distinctio eligendi? Corrupti distinctio iusto earum error autem accusantium veniam, explicabo quibusdam.</p>\r\n\r\n<p>In necessitatibus ducimus perspiciatis, veniam hic eligendi amet incidunt modi nam earum odio placeat molestias voluptatibus beatae consequuntur delectus vitae magni? Eveniet quod ex natus ducimus iure! In, iste fugiat.\r\nFugiat, eveniet. Reprehenderit a temporibus pariatur libero debitis corporis necessitatibus quidem mollitia, impedit inventore expedita quisquam ipsam veritatis animi sed non dolore? Fugiat rem error nisi, optio consequatur inventore cum.\r\nBlanditiis nam quibusdam sit odio expedita, quidem quisquam quam hic accusantium, provident eos dolorum facilis ratione pariatur cupiditate. Dolores ad ducimus repudiandae quisquam recusandae tenetur cum ea quibusdam vero fugiat!</p>\r\n', '2024-11-07 13:37:55', 1, 42, 29),
(44, 'Changer ses plaquettes de frein', 'plaquetteFrein.webp', 'Vue d\'une plaquette de frein montée sur le disque prête à être démontée ', '<p>Effectuer le changement des plaquettes est un travail restant à la portée de tous, rien de compliqué, assurez-vous cependant de bien respecter les points suivants :</p>\r\n\r\n<p>Commencez par positionner votre véhicule sur une surface bien plane. Lorsque vous soulèverez la voiture à l\'aide du cric, celui-ci doit être parfaitement stable. Vous trouverez des indicateurs de positionnement sous le véhicule permettant de lever ce dernier.</p>\r\n\r\n<p>Les écrous de roues devront reposer sur leur tête pour ne pas risquer de les perdre ou d\'endommager le pas de vis. Avant de monter les nouvelles plaquettes il faut démonter les anciennes ; prenez soin de bien repérer l\'emplacement des pièces que vous démontez et leur ordre. Si vous commencez par le freinage avant, faites-le en entier puis passez ensuite à l\'arrière. Ainsi, si vous doutez de quelque chose lors du remontage, l\'autre roue servira d\'exemple.</p>\r\n\r\n<p>Munissez-vous d\'outils adéquats. Les colonnettes des étriers de frein sont fortement serrées et nécessitent un outillage spécialisé de manière à ne pas endommager les écrous de fixation.</p>\r\n\r\n<p>Repoussez le piston en faisant attention à ne pas endommager le caoutchouc cache poussière avec l\'outil que vous utilisez. Le plus simple et le moins dangereux est souvent de laisser la plaquette côté piston et de s\'en servir comme appui pour repousser le piston. Glissez ainsi un tournevis entre le disque et la plaquette en question et faites levier.</p>\r\n\r\n<p>Pensez à bien resserrer les écrous et boulons en tout genre et vérifier que la moindre pièce à été montée. Pompez ensuite sur la pédale de frein de manière à coller les plaquettes de frein sur la surface du disque. Cette opération est indispensable sinon vous ne disposerez d\'aucune force de freinage la première fois que vous aurez à vous servir de la pédale !</p>', '2024-11-07 14:03:11', 1, 42, 29),
(45, 'Diagnostiquer une eau verte', 'piscineEauVerte.webp', 'Piscine vue de face avec une eau verte turquoise', '\r\n<p><strong>L’eau est verte mais reste claire et transparente :</strong>\r\nCe phénomène est souvent dû à une présence excessive de cuivre dans l\'eau, généralement causée par un pH trop bas ou un problème de corrosion des équipements. La solution consiste à ajuster le pH si nécessaire et à faire fonctionner le système de filtration en continu pour purifier l’eau.</p>\r\n\r\n<p><strong>L’eau est verte et trouble :</strong>\r\nSi l’eau est non seulement verte mais aussi trouble, c’est probablement en raison de la présence d\'algues. Il est recommandé de vérifier à nouveau le pH et de l\'ajuster si besoin. Par la suite, un traitement choc au chlore est conseillé, en laissant le système de filtration tourner sans interruption. Pour éliminer les algues, une simple brosse ou un balai télescopique avec un produit nettoyant fera l\'affaire.</p>\r\n\r\n<p><strong>L’eau est verte, et les parois sont collantes et verdâtres :</strong>\r\nDans ce cas, la prolifération d’algues est également en cause. La procédure reste similaire : commencez par ajuster le pH de l’eau, vérifiez l\'état de la filtration pour éviter qu\'elle ne soit obstruée ou défectueuse, nettoyez les parois et le fond du bassin pour retirer les algues visibles, et maintenez la filtration en marche continue. Pour finir, effectuez un traitement choc avec du chlore ou ajoutez un algicide à l\'eau. En général, une augmentation de la concentration en chlore permet de résoudre efficacement ce problème.</p>\r\n\r\n\r\n\r\n\r\n', '2024-11-07 14:22:25', 1, 42, 39),
(46, 'Nettoyage d\'un carburateur', 'carbu.webp', 'Carburateur avec une grenouille entrain de commencer le démontage du premier boulon de celui ci, c\'est une photo amusante.', '<p>D\'abord, t\'arrêtes la machine et tu laisses refroidir. Le but, c\'est d\'éviter les départs en fanfare accidentels.</p>\r\n\r\n<p>Bye-bye le réservoir d\'essence ! Tu le vides complètement pour éviter les dégâts. On veut pas d\'essence qui traîne partout.</p>\r\n\r\n<p>Faut débusquer ce fameux carburateur maintenant. En général, il se planque du côté droit ou gauche du moteur, copain/copine du filtre à air et du tuyau d\'admission.</p>\r\n\r\n<p>Avec une clé à douille ou à pipe, tu déconnectes les tuyaux d\'essence et d\'air du carburateur. Les vis ou écrous qui le tiennent en place, tu les dévisses.\r\nEnsuite, hop, tu dégages ce carburateur et tu le poses de côté.\r\n\r\n<p>Pour le p\'tit nouveau, suis les instructions du fabricant. T\'installes ça proprement, en t\'assurant que tous les tuyaux et les connexions sont bien branchés.\r\nRevisse les vis ou écrous pour que ton nouveau carburateur soit à sa place.\r\n\r\n<p>Raccroche les tuyaux d\'essence et d\'air sur ce carburateur flambant neuf.\r\nLe fil d\'allumage, tu le remets en action et tu fais le plein d\'essence.</p>\r\n\r\n<p>Il est temps de tester ! Vérifie que tout est bien en place et que ton nouveau carburateur fait son boulot comme il faut.</p>', '2024-11-07 14:54:31', 1, 42, 29),
(47, 'Le démontage de la résistance du chauffe eau', 'chauffeEau.webp', 'bricoleurExt.jpg', '<p>Pour commencer avant toute manipulation couper en énergie le chauffe eau, cela serait dommage de prendre une charge😅.Pour tester si la résistance fonctionne il vous faudra parcontre avoir le jus.</p><p>Pour établir un diagnostic avec un multimètre, déterminez la résistance de l’élément de votre modèle. Pour ce faire, consultez la puissance en W de la résistance électrique de votre chauffe-eau soit dans la fiche technique soit sur la plaquette collée sur la cuve. Ensuite, une fois que vous avez établi la puissance de votre résistance, effectuez les calculs selon la formule suivante :</p>\r\n\r\n<p>VΩ=UxU/P ou « P » représente la puissance de la résistance en W, par exemple 2200W,  « U » la tension d’alimentation électrique en Volts et le « VΩ » et la valeur ohmique que vous voulez établir. Donc, dans notre cas la valeur ohmique VΩ : 220×220/2200 = 24,4 Ω (ohm).</p>\r\n<p> Ensuite pour le démontage il vous faudra :<p><br><ul>\r\n<li>Tournevis cruciforme</li>\r\n\r\n<li>Tournevis plat</li>\r\n\r\n<li>Clé à douille, à tube ou à molette</li>\r\n\r\n<li>Une brosse dure</li>\r\n\r\n<li>Du vinaigre blanc</li>\r\n\r\n<li>Une résistance neuve</li>\r\n\r\n<li>Un joint en caoutchouc neuf, pour la bride</li>\r\n</ul>\r\n\r\nLa procédure de remplacement d’une résistance blindé consiste en plusieurs étapes successives :\r\n<ul>\r\n\r\n<li> Coupez au tableau le disjoncteur responsable de l’alimentation électrique de votre chauffe-eau ;</li>\r\n\r\n<li>Effectuez la vidange complète de la cuve (cliquez ici pour un guide de vidange chauffe-eau électrique) ;</li>\r\n\r\n<li>Enlevez le capot (couvercle extérieur) qui recouvre la partie électrique de l’appareil ;</li>\r\n\r\n<li>Prenez des photos de toutes les branchements afin de ne vous pas tromper lors de réassemblage ;</li>\r\n\r\n<li>Dévissez les boulons (écrous) de la bride qui fixe la résistance en place pendant le fonctionnement (il possible d’avoir une résistance déformée, à cause de la chaleur excessive, ce qui peut rendre difficile le démontage) ;</li>\r\n\r\n<li>Enlevez le joint en caoutchouc ;</li>\r\n\r\n<li>Retirez soigneusement la résistance de l’intérieur de la cuve (il est recommandé de le faire au-dessus d’un seau ou d’une bassine pour éviter l’écoulement de l’eau par terre) ;</li>\r\n\r\n<li>A l’aide de la brosse dure et du vinaigre blanc nettoyez la cuve ;</li>\r\n\r\n<li>Rincez la cuve à l’aide d’un jet d’eau</li>\r\n\r\n<li>Le remontage s’effectue au reprenant les étapes au sens l’inverse (utilisez les photos prises en préalable).</li>\r\n\r\nFaites attention au joint en caoutchouc (si le joint n’est pas en bon état, il conviendra de le remplacer afin d’assurer une bonne étanchéité). Il est également recommandé d’acheter les pièces de rechange dans des magasins spécialisés, en faisant attention à la qualité de fabrication un conseiller va vous aider à trouver la résistance qui convient au modèle de votre chauffe-eau électrique) ;', '2024-11-07 15:16:23', 1, 42, 20),
(48, 'Changement d\'une bougie sur un poel à pellet', 'Mon poel.webp', 'Poël vu de face avec un fond en parement blanc', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Labore blanditiis porro ratione numquam esse, saepe recusandae, rem sint placeat odio neque odit dolorem ullam ea quam. Culpa odio tenetur eius!</p>\r\n<p>Non eaque adipisci dicta nisi officiis in incidunt expedita natus dignissimos veritatis? Soluta iste, adipisci repudiandae a commodi sapiente cum voluptatem nulla debitis, ab, illo quam dolor unde laborum. Veritatis?\r\nIncidunt accusamus praesentium, nam dolore quos architecto dolor eius? Aspernatur ullam dolorem laudantium porro nam, officia error quia! Similique eum reprehenderit quis quaerat minima numquam accusantium, facilis est at suscipit!</p>\r\n<p>Molestiae vero ullam recusandae, est placeat accusamus ea sunt architecto vel nemo sit rem dolor provident. Ex rerum enim libero ipsa, animi necessitatibus? Ex atque quia, rerum magnam illo dolore?\r\nIusto modi laboriosam perspiciatis qui facere. Eligendi exercitationem repudiandae iure accusamus, expedita magnam rem voluptatibus vitae et aliquid repellat quasi explicabo aliquam voluptas mollitia, nostrum vero, reprehenderit reiciendis deleniti modi!</p>\r\n<p>Possimus aperiam magni quibusdam modi voluptates distinctio sunt, aliquid atque quisquam doloribus, assumenda eos nisi error, harum quasi? Quo hic, amet saepe assumenda voluptates quam sit aut possimus nemo autem.\r\nTempora obcaecati eveniet deleniti, dicta necessitatibus, eos numquam iusto, autem placeat doloremque cupiditate quae dolor minus laudantium repudiandae quaerat laborum ab maiores corrupti officia minima. Quae modi aut velit asperiores?\r\nExercitationem, consectetur facilis, facere soluta laudantium odio maiores itaque provident porro, sapiente deleniti ipsam numquam culpa nihil aliquid voluptatibus natus nemo possimus. Culpa, sed nemo. Odit magni architecto molestias unde!<p>', '2024-11-07 16:00:13', 1, 42, 20),
(49, 'Mise en place de la tv au mur', 'tv.webp', 'télévision fixé au mur', '\r\n\r\n<p>Installer un téléviseur au mur optimise l’espace en éliminant le besoin de meubles encombrants. Cette solution favorise également une expérience visuelle plus confortable et immersive. Voici les étapes essentielles pour monter votre téléviseur en toute sécurité.</p><br>\r\n<ol>\r\n<li> Préparez Vos Outils\r\nAvant de commencer, assurez-vous d\'avoir les outils nécessaires :\r\n\r\nSupport mural : Choisissez un support adapté aux dimensions VESA de votre téléviseur.\r\nPerceuse électrique : Pour gagner du temps, utilisez une perceuse plutôt qu\'un tournevis.\r\nMèches adaptées : Pour la fixation, utilisez une mèche à maçonnerie et une tête Phillips pour les vis.\r\nDétecteur de montants : Fixez le support sur un montant pour une meilleure stabilité.\r\nNiveau : Assurez-vous que le téléviseur est bien droit.\r\nAide d’un ami : Monter un téléviseur peut être délicat sans assistance.</li>\r\n<li> Choisissez l’Emplacement\r\nSélectionnez un mur proche d’une prise électrique, dans un angle permettant une vue confortable depuis votre coin salon. Veillez également aux angles de vision pour une expérience optimale, car déplacer le téléviseur par la suite pourrait nécessiter de reboucher les trous laissés par les fixations initiales.</li>\r\n\r\n<li>Localisez les Montants\r\nÀ l\'aide du détecteur, identifiez l’emplacement des montants dans le mur. Une fois repérés, marquez leur position avec du ruban adhésif pour une installation précise.</li>\r\n\r\n<li>Marquez et Percez les Avant-trous\r\nAprès avoir identifié les montants, posez le support contre le mur, vérifiez qu\'il est droit avec le niveau, puis marquez les points de perçage au crayon. Percez ensuite les avant-trous aux endroits marqués.</li>\r\n\r\n<li>Vissez le Support\r\nFixez le support en perçant directement dans les montants pour plus de stabilité. Assurez-vous que chaque côté du support est solidement vissé pour un montage sécurisé.</li>\r\n\r\n<li>Installez le Téléviseur\r\nEn suivant les instructions du fabricant, fixez la plaque de montage à l\'arrière du téléviseur, puis alignez-le avec le support mural. Vérifiez une dernière fois l\'alignement avec un niveau.</li>\r\n\r\n<li>Dissimulez les Câbles\r\nSi nécessaire, utilisez un kit de gestion des câbles pour organiser et masquer les fils. Alternativement, un cache-fils ou du ruban adhésif peut aider à dissimuler les câbles visibles.</li>\r\n\r\n', '2024-11-07 16:20:58', 1, 42, 20);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Divers'),
(19, 'Extérieur'),
(20, 'Intérieur'),
(29, 'Mecanique'),
(39, 'Piscine');

--
-- Déclencheurs `category`
--
DROP TRIGGER IF EXISTS `before_delete_category`;
DELIMITER $$
CREATE TRIGGER `before_delete_category` BEFORE DELETE ON `category` FOR EACH ROW BEGIN
UPDATE article 
SET category_id = 1
WHERE category_id = OLD.id;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `publish_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL,
  `article_id` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `comment_ibfk_1` (`article_id`),
  KEY `comment_ibfk_2` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `content`, `publish_date`, `user_id`, `article_id`, `status`) VALUES
(86, 'Serait t-il possible de compléter l\'article ?', '2024-11-06 23:18:21', 42, 40, 1),
(87, 'Dis donc le moteur est dans un état 😂', '2024-11-07 13:48:22', 42, 43, 1),
(88, 'Avec une vidéos en plus sa serait le top  😉  😉 ', '2024-11-07 14:13:27', 42, 44, 1),
(89, 'Mon eau est verte depuis 1 mois même avec les traitements je n\'en viens pas à bout  😥', '2024-11-07 14:27:22', 42, 45, 1),
(90, 'J\'ai le même robot il est super efficace !', '2024-11-07 14:28:11', 42, 41, 1),
(91, 'Photo de la grenouille mdr 😭😭😭', '2024-11-07 14:59:31', 42, 46, 1),
(92, 'Nous aimerions aussi faire installer ceci chez nous, avec toutes les augmentations pour se chauffer cela est plus que rentable.', '2024-11-07 16:01:38', 42, 48, 1),
(93, 'Merci pour le tuto 😊😊😊.', '2024-11-07 16:02:17', 42, 47, 1),
(94, 'C\'est un gain d\'espace incroyable, faite le !👍👍👍', '2024-11-07 16:36:58', 42, 49, 1),
(95, 'Oui j\'ai aussi eu le même problème', '2024-11-07 22:41:11', NULL, 45, 1),
(97, 'teste', '2024-11-10 19:00:13', 42, 40, 0),
(113, 'pas mal', '2024-12-05 16:20:16', NULL, 40, 1),
(114, 'xzex', '2024-12-05 16:40:34', NULL, 45, 1),
(115, 'cez', '2024-12-05 16:43:27', NULL, 45, 1),
(116, 'dézedcx', '2024-12-05 16:45:09', NULL, 45, 1),
(117, 'dzdzdzdzdzdzdzdzdz', '2024-12-05 16:45:19', NULL, 45, 1),
(119, 'Bonjour nous avons le même ballon d\'eau chaude et nous avons eu le même problème 😡😡.', '2024-12-09 11:38:39', 53, 47, 1),
(120, 'Nous avons aussi sauté le pas impeccable, nous ne sommes pas déçu !', '2024-12-09 11:45:04', 53, 48, 1),
(121, 'Surtout pour les grandes TV car quand elles sont sur le socles elles prennent une place monstre, l\'horreur 😆😆😆😆😆.', '2024-12-09 11:46:56', 53, 49, 1),
(122, 'J\'aimerais aussi bientôt poster une vidéo lors du montage de la notre, j\'espère que cela sera bientôt possible sur votre site.', '2024-12-09 11:48:37', 53, 40, 1),
(123, 'Ok il y a aussi les robots hydraulique pour les grandes piscine qui sont incroyable 👍👍👍👍', '2024-12-09 11:49:36', 53, 41, 1),
(124, 'Quelle horreur, effectivement l\'eau est bien verte mais elle n\'est pas foncée c\'est déjà pas mal 👽👽.', '2024-12-09 11:50:34', 53, 45, 1);

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) NOT NULL,
  `publish_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = non lu, 1 = lu',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `name`, `message`, `email`, `publish_date`, `status`) VALUES
(15, 'benjamin', 'Pouvez vous ajouter une catégorie ? ', '', '2024-11-19 09:40:20', 0),
(16, 'benjamin', 'Bonjour j\'aimerais faire partie de l\'équipe.', '', '2024-11-19 09:45:24', 0);

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  `password` char(60) NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` enum('user','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'user',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `role`, `status`) VALUES
(42, 'benjamin', '$2b$10$gkwJiKsjq4iw9QqS4jznTeeONBaElx1k5fpTlhUNtFTpqFzb4IBqm', 'benjamin@gmail.com', 'admin', 1),
(53, 'elodie', '$2b$10$Xxk5a6F4GVfLJdCSeOKR7Oj4jVFzNVzQ6jtVrV0ZugokbKcNW1wXi', 'elodie@gmail.com', 'user', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
