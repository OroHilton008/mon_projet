-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 06 déc. 2024 à 14:04
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
-- Base de données : `gsm_dgir_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

DROP TABLE IF EXISTS `administrateur`;
CREATE TABLE IF NOT EXISTS `administrateur` (
  `code_admin` int NOT NULL AUTO_INCREMENT,
  `nom_utilisateur_admin` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mdp_admin` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cle_reccup_admin` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_admin` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nom_prenom_admin` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact_admin` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `code_type_admin` int DEFAULT NULL,
  `localite_admin` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`code_admin`),
  KEY `administrateur_type_administrateur_FK` (`code_type_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`code_admin`, `nom_utilisateur_admin`, `mdp_admin`, `cle_reccup_admin`, `email_admin`, `nom_prenom_admin`, `contact_admin`, `code_type_admin`, `localite_admin`) VALUES
(1, 'EssohLath', '123456', NULL, 'essoh.christian@dgir.ci', 'Essoh Lath Christian', '0708008499', 1, NULL),
(2, 'AlbanG', '123456', NULL, 'albang@dgir.ci', 'Alban Guei', '03 03 03 03 03', 2, 'Abidjan'),
(3, 'obinok', '123456', NULL, 'obin@gmail.com', 'Obin Kore', '04 05 07 08 09', 3, 'Divo'),
(4, 'Hiro', 'R9vGLR', NULL, 'hiro@gmail.com', 'Hiro Charles', '06 03 01 02 05', 3, 'Touba');

-- --------------------------------------------------------

--
-- Structure de la table `centrale`
--

DROP TABLE IF EXISTS `centrale`;
CREATE TABLE IF NOT EXISTS `centrale` (
  `code_centrale` int NOT NULL AUTO_INCREMENT,
  `localite_centrale` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `localisation_centrale` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `superficie_centrale` double DEFAULT NULL,
  PRIMARY KEY (`code_centrale`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `centrale`
--

INSERT INTO `centrale` (`code_centrale`, `localite_centrale`, `localisation_centrale`, `superficie_centrale`) VALUES
(1, 'Abidjan', 'Yopougon Sable 1er Pont', 1000),
(2, 'Yamoussoukro', 'Quartier Sofa', 450);

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `code_fourni` int NOT NULL AUTO_INCREMENT,
  `designation_fourni` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact_fourni` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_fourni` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bp_fourni` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `adresse_fourni` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`code_fourni`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`code_fourni`, `designation_fourni`, `contact_fourni`, `email_fourni`, `bp_fourni`, `adresse_fourni`) VALUES
(1, 'TRESORKO', '01 01 01 01 01', 'tresorko@tresorko.com', '01 BP 256 Abidjan 01', 'Treichville Gare de Bassam'),
(2, 'ABENAN SARL', '06 06 06 06 06', 'abenansarl@gmail.com', 'BP 257 Agboville', 'Agboville Round point'),
(3, 'IVOIRE INFORMATIQUE', '07 07 07 07 07', 'ivoirinfo@ivoireinf.ci', 'BP 6584 Abidjan 58', 'Abidjan Cocody Angré'),
(4, 'EKIE LIV', '08 05 04 21 02', 'ekieliv@ekiliveinfo.ci', 'BP 4758 Divo', 'Divo Quartier Commerce');

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

DROP TABLE IF EXISTS `materiel`;
CREATE TABLE IF NOT EXISTS `materiel` (
  `code_materiel` int NOT NULL AUTO_INCREMENT,
  `nom_materiel` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prix_unitaire` double DEFAULT NULL,
  PRIMARY KEY (`code_materiel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `parc`
--

DROP TABLE IF EXISTS `parc`;
CREATE TABLE IF NOT EXISTS `parc` (
  `code_parc` int NOT NULL AUTO_INCREMENT,
  `localite_parc` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `localisation_parc` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `superficie_parc` double DEFAULT NULL,
  PRIMARY KEY (`code_parc`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `parc`
--

INSERT INTO `parc` (`code_parc`, `localite_parc`, `localisation_parc`, `superficie_parc`) VALUES
(1, 'Divo', 'Divo Quartier Soleil', 652),
(2, 'Touba', 'Touba face à la Mairie de Touba', 589),
(3, 'Kong', 'Kong Quartier Soukoura', 1000);

-- --------------------------------------------------------

--
-- Structure de la table `type_administrateur`
--

DROP TABLE IF EXISTS `type_administrateur`;
CREATE TABLE IF NOT EXISTS `type_administrateur` (
  `code_type_admin` int NOT NULL AUTO_INCREMENT,
  `designation_type_admin` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`code_type_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_administrateur`
--

INSERT INTO `type_administrateur` (`code_type_admin`, `designation_type_admin`) VALUES
(1, 'Administrateur Général'),
(2, 'Administrateur de Centrale'),
(3, 'Administrateur de Parc');

-- --------------------------------------------------------

--
-- Structure de la table `type_produit`
--

DROP TABLE IF EXISTS `type_produit`;
CREATE TABLE IF NOT EXISTS `type_produit` (
  `code_type_produit` int NOT NULL AUTO_INCREMENT,
  `nom_type_produit` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`code_type_produit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD CONSTRAINT `administrateur_type_administrateur_FK` FOREIGN KEY (`code_type_admin`) REFERENCES `type_administrateur` (`code_type_admin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
