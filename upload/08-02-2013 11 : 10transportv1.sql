-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 08, 2013 at 11:08 AM
-- Server version: 5.5.29
-- PHP Version: 5.3.15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `transportv2`
--

CREATE DATABASE `transportv2`;
use transportv2;
-- --------------------------------------------------------

--
-- Table structure for table `annee`
--

CREATE TABLE IF NOT EXISTS `annee` (
  `idannee` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idannee`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `attachement_conges`
--

CREATE TABLE IF NOT EXISTS `attachement_conges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iddocument` int(11) NOT NULL,
  `idsalarie` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `attachement_cv`
--

CREATE TABLE IF NOT EXISTS `attachement_cv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iddocument` int(11) NOT NULL,
  `idcv` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `attachement_cv`
--

INSERT INTO `attachement_cv` (`id`, `iddocument`, `idcv`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `attachement_materiel`
--

CREATE TABLE IF NOT EXISTS `attachement_materiel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iddocument` int(11) NOT NULL,
  `idconges` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `attachement_materiel`
--

INSERT INTO `attachement_materiel` (`id`, `iddocument`, `idconges`) VALUES
(1, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `attachement_salarie`
--

CREATE TABLE IF NOT EXISTS `attachement_salarie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iddocument` int(11) NOT NULL,
  `idcv` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `idclient` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `cp` int(11) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idclient`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`idclient`, `nom`, `adresse`, `cp`, `ville`) VALUES
(1, 'Jamet', '23 route de nemours', 45122, 'Nemours'),
(2, 'Intermarche', '23 rue raymond Farrugia', 45200, 'Montargis');

-- --------------------------------------------------------

--
-- Table structure for table `conges`
--

CREATE TABLE IF NOT EXISTS `conges` (
  `idconges` int(11) NOT NULL AUTO_INCREMENT,
  `dateDebut` varchar(45) DEFAULT NULL,
  `dateFin` varchar(45) DEFAULT NULL,
  `motif` varchar(45) DEFAULT NULL,
  `salarie_idsalarie` int(11) NOT NULL,
  `etat_idetat` int(11) NOT NULL,
  PRIMARY KEY (`idconges`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `conso`
--

CREATE TABLE IF NOT EXISTS `conso` (
  `idconso` int(11) NOT NULL AUTO_INCREMENT,
  `kilometrage` varchar(45) DEFAULT NULL,
  `litrage` varchar(45) DEFAULT NULL,
  `materiel_idmateriel` int(11) NOT NULL,
  `mois_idmois` int(11) NOT NULL,
  PRIMARY KEY (`idconso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contrat`
--

CREATE TABLE IF NOT EXISTS `contrat` (
  `idcontrat` int(11) NOT NULL AUTO_INCREMENT,
  `dateDebut` varchar(45) DEFAULT NULL,
  `dateFin` varchar(45) DEFAULT NULL,
  `MotifsFin` varchar(250) DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `typeContrat_idcontrat` int(11) NOT NULL,
  `idSalarie` int(11) NOT NULL,
  `idEtatContrat` int(11) NOT NULL,
  PRIMARY KEY (`idcontrat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `contrat`
--

INSERT INTO `contrat` (`idcontrat`, `dateDebut`, `dateFin`, `MotifsFin`, `duree`, `typeContrat_idcontrat`, `idSalarie`, `idEtatContrat`) VALUES
(1, '25/04/10', '25/04/12', NULL, 2, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cv`
--

CREATE TABLE IF NOT EXISTS `cv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `date` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cv`
--

INSERT INTO `cv` (`id`, `nom`, `prenom`, `mail`, `date`) VALUES
(1, 'STEFANSKI', 'Adrien', 'adrien.stefanski@gmail.com', '29/09/1992');

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE IF NOT EXISTS `document` (
  `nom` varchar(50) NOT NULL,
  `commentaire` varchar(250) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `path` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`nom`, `commentaire`, `extension`, `path`, `type`, `id`) VALUES
('test', 'fichier de test 1 ', '.txt', '../../../upload/test20122809201207.txt', 'tracteur', 1),
('test', 'fichier de test 1 ', '.txt', '../../../upload/test20122809201323.txt', 'tracteur', 2);

-- --------------------------------------------------------

--
-- Table structure for table `elementfacturation`
--

CREATE TABLE IF NOT EXISTS `elementfacturation` (
  `idelementFacturation` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) DEFAULT NULL,
  `prixUnitaire` float DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `facture_idfacture` int(11) NOT NULL,
  PRIMARY KEY (`idelementFacturation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `etat`
--

CREATE TABLE IF NOT EXISTS `etat` (
  `idetat` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idetat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `etat`
--

INSERT INTO `etat` (`idetat`, `libelle`) VALUES
(1, 'Accepter'),
(2, 'Refuser'),
(3, 'En attente');

-- --------------------------------------------------------

--
-- Table structure for table `etat_contrat`
--

CREATE TABLE IF NOT EXISTS `etat_contrat` (
  `idEtatContrat` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`idEtatContrat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `etat_contrat`
--

INSERT INTO `etat_contrat` (`idEtatContrat`, `libelle`) VALUES
(1, 'Actif'),
(2, 'Inactif');

-- --------------------------------------------------------

--
-- Table structure for table `facture`
--

CREATE TABLE IF NOT EXISTS `facture` (
  `idfacture` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `totalHT` varchar(45) DEFAULT NULL,
  `tva` varchar(45) DEFAULT NULL,
  `totalTTC` varchar(45) DEFAULT NULL,
  `client_idclient` int(11) NOT NULL,
  PRIMARY KEY (`idfacture`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `feuilleroute`
--

CREATE TABLE IF NOT EXISTS `feuilleroute` (
  `idfeuilleRoute` int(11) NOT NULL AUTO_INCREMENT,
  `dateFeuille` date NOT NULL,
  `km_arrivee` varchar(45) DEFAULT NULL,
  `km_depart` varchar(45) DEFAULT NULL,
  `horaire_arrivee` varchar(45) DEFAULT NULL,
  `horaire_depart` varchar(45) DEFAULT NULL,
  `nuit` int(5) DEFAULT NULL,
  `totalHeures` int(5) NOT NULL,
  `barriereArrivee` varchar(5) DEFAULT NULL,
  `barriereDepart` varchar(5) DEFAULT NULL,
  `gazoile` varchar(45) DEFAULT NULL,
  `kilometre` varchar(45) DEFAULT NULL,
  `conso` varchar(45) DEFAULT NULL,
  `salarie_idsalarie` int(11) NOT NULL,
  `client_idclient` int(11) NOT NULL,
  `numTournee` varchar(25) DEFAULT NULL,
  `numContrat` varchar(25) DEFAULT NULL,
  `numTracteur` int(10) NOT NULL,
  PRIMARY KEY (`idfeuilleRoute`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `feuilleroute`
--

INSERT INTO `feuilleroute` (`idfeuilleRoute`, `dateFeuille`, `km_arrivee`, `km_depart`, `horaire_arrivee`, `horaire_depart`, `nuit`, `totalHeures`, `barriereArrivee`, `barriereDepart`, `gazoile`, `kilometre`, `conso`, `salarie_idsalarie`, `client_idclient`, `numTournee`, `numContrat`, `numTracteur`) VALUES
(15, '2012-12-12', '3458', '3456', '14h54', '23h56', 5, 46, '21h56', '12h08', '456', '2', '78', 4, 1, '435', '2345678', 2),
(16, '2012-12-13', '64353', '34565', '20h45', '04h45', 5, 12, '00h04', '23h34', '543', '345', '34', 4, 1, '543', '654', 2),
(17, '2012-12-20', '3458', '3456', '14h54', '12h56', 5, 9, '21h56', '12h08', '456', '2', '78', 4, 1, '435', '2345678', 2),
(18, '2012-12-21', '64353', '3456', '14h54', '04h45', 10, 17, '21h56', '12h08', '456', '345', '78', 4, 1, '435', '2345678', 2),
(19, '2012-12-26', '3458', '3456', '14h54', '12h56', 6, 12, '21h56', '12h08', '456', '2', '22800', 4, 1, '435', '2345678', 3);

-- --------------------------------------------------------

--
-- Table structure for table `jour`
--

CREATE TABLE IF NOT EXISTS `jour` (
  `idjour` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idjour`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `materiel`
--

CREATE TABLE IF NOT EXISTS `materiel` (
  `idmateriel` int(11) NOT NULL AUTO_INCREMENT,
  `immatriculation` varchar(45) DEFAULT NULL,
  `dateAcquisition` varchar(45) DEFAULT NULL,
  `typeAcquisition` varchar(45) DEFAULT NULL,
  `nom` varchar(50) NOT NULL,
  `kilometrage` int(11) NOT NULL,
  `type_materiel_idtype_materiel` int(11) NOT NULL,
  PRIMARY KEY (`idmateriel`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `materiel`
--

INSERT INTO `materiel` (`idmateriel`, `immatriculation`, `dateAcquisition`, `typeAcquisition`, `nom`, `kilometrage`, `type_materiel_idtype_materiel`) VALUES
(2, 'AK 699 QZ', '01/05/2011', 'Achat BRAMINI', 'Tracteur VOLVO', 345, 1),
(3, 'BE 807 FT', '01/05/2011', 'Achat BRAMINI', 'Tracteur Scania', 2, 1),
(4, 'BN 800 WN', '01/05/2011', 'ACHAT STEFANSKI E.I.', 'Tracteur VOLVO', 0, 1),
(5, 'BR 894 JS', '12/07/2011', 'Leasing SCANIA', 'Tracteur Scania', 0, 1),
(6, 'BR 805 PJ', '18/07/2011', 'Leasing SCANIA', 'Tracteur Scania', 0, 1),
(8, 'BB 796 TC', '01/05/2011', 'Achat STEFANSKI E.I.', 'Benne ESTEREL', 0, 2),
(9, 'BN 725 WN', '01/05/2011', 'Achat STEFANSKI E.I.', 'Benne BENALU', 0, 2),
(10, 'BN 202 RK', '01/05/2011', 'Achat STEFANSKI E.I.', 'Mercedes VITO', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `mois`
--

CREATE TABLE IF NOT EXISTS `mois` (
  `idmois` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmois`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `qualitesalarie`
--

CREATE TABLE IF NOT EXISTS `qualitesalarie` (
  `idqualiteSalarie` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idqualiteSalarie`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `qualitesalarie`
--

INSERT INTO `qualitesalarie` (`idqualiteSalarie`, `libelle`) VALUES
(1, 'chauffeur'),
(2, 'apprenti');

-- --------------------------------------------------------

--
-- Table structure for table `salaire`
--

CREATE TABLE IF NOT EXISTS `salaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annee` int(4) NOT NULL,
  `mois` int(2) NOT NULL,
  `idchauffeur` int(11) NOT NULL,
  `salaireBrut` int(10) NOT NULL,
  `prime` int(10) NOT NULL,
  `congesPayes` int(10) NOT NULL,
  `maladie` int(10) NOT NULL,
  `congesExcept` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `salarie`
--

CREATE TABLE IF NOT EXISTS `salarie` (
  `idsalarie` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `numsecu` varchar(45) DEFAULT NULL,
  `dateNaissance` varchar(45) DEFAULT NULL,
  `lieuNaissance` varchar(45) DEFAULT NULL,
  `dateEmbauche` varchar(10) NOT NULL,
  `qualiteSalarie_idqualiteSalarie` int(11) NOT NULL,
  PRIMARY KEY (`idsalarie`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `salarie`
--

INSERT INTO `salarie` (`idsalarie`, `nom`, `prenom`, `numsecu`, `dateNaissance`, `lieuNaissance`, `dateEmbauche`, `qualiteSalarie_idqualiteSalarie`) VALUES
(3, 'BARBIER', 'Brandon', '111111', '29/02/1995', 'Montargis', '', 2),
(4, 'BILLARD', 'Jérémy', '111111', '20/04/87', 'Fault sur Yonne (77)', '22/06/2011', 1),
(5, 'BOURDIN', 'Yvon', '111111', '13/12/49', 'Montargis', '', 1),
(6, 'CHIRON', 'Baptiste', '111111', '27/11/1978', 'Longjumeau (91)', '18/06/2012', 1),
(7, 'CADEAU', 'Stéphane', '111111', '26/11/1974', 'Pavillon sous Bois (93)', '01/05/2011', 1),
(8, 'CHEVALIER', 'Didier', '111111', '13/04/1966', 'Créteil (94)', '09/11/2012', 1);

-- --------------------------------------------------------

--
-- Table structure for table `typecontrat`
--

CREATE TABLE IF NOT EXISTS `typecontrat` (
  `idtypecontrat` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) DEFAULT NULL,
  `modele` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idtypecontrat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `typecontrat`
--

INSERT INTO `typecontrat` (`idtypecontrat`, `libelle`, `modele`) VALUES
(1, 'CDD', NULL),
(2, 'CDI', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `type_materiel`
--

CREATE TABLE IF NOT EXISTS `type_materiel` (
  `idtype_materiel` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtype_materiel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `login`, `password`, `mail`) VALUES
(1, 'Admin', 'f679c422182842d7ef53d1b4274d3357', 'adrien.stefanski@gmail.com');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
