-- ----------------------
-- dump de la base transportv1 au 08-Feb-2013
-- ----------------------


-- -----------------------------
-- creation de la table annee
-- -----------------------------
CREATE TABLE `annee` (
  `idannee` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idannee`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table attachement_conges
-- -----------------------------
CREATE TABLE `attachement_conges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iddocument` int(11) NOT NULL,
  `idsalarie` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table attachement_cv
-- -----------------------------
CREATE TABLE `attachement_cv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iddocument` int(11) NOT NULL,
  `idcv` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table attachement_materiel
-- -----------------------------
CREATE TABLE `attachement_materiel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iddocument` int(11) NOT NULL,
  `idconges` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table attachement_salarie
-- -----------------------------
CREATE TABLE `attachement_salarie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iddocument` int(11) NOT NULL,
  `idcv` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table client
-- -----------------------------
CREATE TABLE `client` (
  `idclient` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `cp` int(11) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idclient`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table conges
-- -----------------------------
CREATE TABLE `conges` (
  `idconges` int(11) NOT NULL AUTO_INCREMENT,
  `dateDebut` varchar(45) DEFAULT NULL,
  `dateFin` varchar(45) DEFAULT NULL,
  `motif` varchar(45) DEFAULT NULL,
  `salarie_idsalarie` int(11) NOT NULL,
  `etat_idetat` int(11) NOT NULL,
  PRIMARY KEY (`idconges`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table conso
-- -----------------------------
CREATE TABLE `conso` (
  `idconso` int(11) NOT NULL AUTO_INCREMENT,
  `kilometrage` varchar(45) DEFAULT NULL,
  `litrage` varchar(45) DEFAULT NULL,
  `materiel_idmateriel` int(11) NOT NULL,
  `mois_idmois` int(11) NOT NULL,
  PRIMARY KEY (`idconso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table contrat
-- -----------------------------
CREATE TABLE `contrat` (
  `idcontrat` int(11) NOT NULL AUTO_INCREMENT,
  `dateDebut` varchar(45) DEFAULT NULL,
  `dateFin` varchar(45) DEFAULT NULL,
  `MotifsFin` varchar(250) DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `typeContrat_idcontrat` int(11) NOT NULL,
  `idSalarie` int(11) NOT NULL,
  `idEtatContrat` int(11) NOT NULL,
  PRIMARY KEY (`idcontrat`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table cv
-- -----------------------------
CREATE TABLE `cv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `date` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table document
-- -----------------------------
CREATE TABLE `document` (
  `nom` varchar(50) NOT NULL,
  `commentaire` varchar(250) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `path` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table elementfacturation
-- -----------------------------
CREATE TABLE `elementfacturation` (
  `idelementFacturation` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) DEFAULT NULL,
  `prixUnitaire` float DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `facture_idfacture` int(11) NOT NULL,
  PRIMARY KEY (`idelementFacturation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table etat
-- -----------------------------
CREATE TABLE `etat` (
  `idetat` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idetat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table etat_contrat
-- -----------------------------
CREATE TABLE `etat_contrat` (
  `idEtatContrat` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`idEtatContrat`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table facture
-- -----------------------------
CREATE TABLE `facture` (
  `idfacture` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `totalHT` varchar(45) DEFAULT NULL,
  `tva` varchar(45) DEFAULT NULL,
  `totalTTC` varchar(45) DEFAULT NULL,
  `client_idclient` int(11) NOT NULL,
  PRIMARY KEY (`idfacture`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table feuilleroute
-- -----------------------------
CREATE TABLE `feuilleroute` (
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table jour
-- -----------------------------
CREATE TABLE `jour` (
  `idjour` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idjour`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table materiel
-- -----------------------------
CREATE TABLE `materiel` (
  `idmateriel` int(11) NOT NULL AUTO_INCREMENT,
  `immatriculation` varchar(45) DEFAULT NULL,
  `dateAcquisition` varchar(45) DEFAULT NULL,
  `typeAcquisition` varchar(45) DEFAULT NULL,
  `nom` varchar(50) NOT NULL,
  `kilometrage` int(11) NOT NULL,
  `type_materiel_idtype_materiel` int(11) NOT NULL,
  PRIMARY KEY (`idmateriel`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table mois
-- -----------------------------
CREATE TABLE `mois` (
  `idmois` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmois`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table qualitesalarie
-- -----------------------------
CREATE TABLE `qualitesalarie` (
  `idqualiteSalarie` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idqualiteSalarie`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table salaire
-- -----------------------------
CREATE TABLE `salaire` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table salarie
-- -----------------------------
CREATE TABLE `salarie` (
  `idsalarie` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `numsecu` varchar(45) DEFAULT NULL,
  `dateNaissance` varchar(45) DEFAULT NULL,
  `lieuNaissance` varchar(45) DEFAULT NULL,
  `dateEmbauche` varchar(10) NOT NULL,
  `qualiteSalarie_idqualiteSalarie` int(11) NOT NULL,
  PRIMARY KEY (`idsalarie`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table type_materiel
-- -----------------------------
CREATE TABLE `type_materiel` (
  `idtype_materiel` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtype_materiel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table typecontrat
-- -----------------------------
CREATE TABLE `typecontrat` (
  `idtypecontrat` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) DEFAULT NULL,
  `modele` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idtypecontrat`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table utilisateur
-- -----------------------------
CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



-- -----------------------------
-- insertions dans la table annee
-- -----------------------------

-- -----------------------------
-- insertions dans la table attachement_conges
-- -----------------------------

-- -----------------------------
-- insertions dans la table attachement_cv
-- -----------------------------
INSERT INTO attachement_cv VALUES(1, 2, 1);

-- -----------------------------
-- insertions dans la table attachement_materiel
-- -----------------------------
INSERT INTO attachement_materiel VALUES(1, 2, 3);

-- -----------------------------
-- insertions dans la table attachement_salarie
-- -----------------------------

-- -----------------------------
-- insertions dans la table client
-- -----------------------------
INSERT INTO client VALUES(1, 'Jamet', '23 route de nemours', 45122, 'Nemours');
INSERT INTO client VALUES(2, 'Intermarche', '23 rue raymond Farrugia', 45200, 'Montargis');

-- -----------------------------
-- insertions dans la table conges
-- -----------------------------

-- -----------------------------
-- insertions dans la table conso
-- -----------------------------

-- -----------------------------
-- insertions dans la table contrat
-- -----------------------------
INSERT INTO contrat VALUES(1, '25/04/10', '25/04/12', '', 2, 1, 1, 1);

-- -----------------------------
-- insertions dans la table cv
-- -----------------------------
INSERT INTO cv VALUES(1, 'STEFANSKI', 'Adrien', 'adrien.stefanski@gmail.com', '29/09/1992');

-- -----------------------------
-- insertions dans la table document
-- -----------------------------
INSERT INTO document VALUES('test', 'fichier de test 1 ', '.txt', '../../../upload/test20122809201207.txt', 'tracteur', 1);
INSERT INTO document VALUES('test', 'fichier de test 1 ', '.txt', '../../../upload/test20122809201323.txt', 'tracteur', 2);

-- -----------------------------
-- insertions dans la table elementfacturation
-- -----------------------------

-- -----------------------------
-- insertions dans la table etat
-- -----------------------------
INSERT INTO etat VALUES(1, 'Accepter');
INSERT INTO etat VALUES(2, 'Refuser');
INSERT INTO etat VALUES(3, 'En attente');

-- -----------------------------
-- insertions dans la table etat_contrat
-- -----------------------------
INSERT INTO etat_contrat VALUES(1, 'Actif');
INSERT INTO etat_contrat VALUES(2, 'Inactif');

-- -----------------------------
-- insertions dans la table facture
-- -----------------------------

-- -----------------------------
-- insertions dans la table feuilleroute
-- -----------------------------
INSERT INTO feuilleroute VALUES(15, 2012-12-12, '3458', '3456', '14h54', '23h56', 5, 46, '21h56', '12h08', '456', '2', '78', 4, 1, '435', '2345678', 2);
INSERT INTO feuilleroute VALUES(16, 2012-12-13, '64353', '34565', '20h45', '04h45', 5, 12, '00h04', '23h34', '543', '345', '34', 4, 1, '543', '654', 2);
INSERT INTO feuilleroute VALUES(17, 2012-12-20, '3458', '3456', '14h54', '12h56', 5, 9, '21h56', '12h08', '456', '2', '78', 4, 1, '435', '2345678', 2);
INSERT INTO feuilleroute VALUES(18, 2012-12-21, '64353', '3456', '14h54', '04h45', 10, 17, '21h56', '12h08', '456', '345', '78', 4, 1, '435', '2345678', 2);
INSERT INTO feuilleroute VALUES(19, 2012-12-26, '3458', '3456', '14h54', '12h56', 6, 12, '21h56', '12h08', '456', '2', '22800', 4, 1, '435', '2345678', 3);

-- -----------------------------
-- insertions dans la table jour
-- -----------------------------

-- -----------------------------
-- insertions dans la table materiel
-- -----------------------------
INSERT INTO materiel VALUES(2, 'AK 699 QZ', '01/05/2011', 'Achat BRAMINI', 'Tracteur VOLVO', 345, 1);
INSERT INTO materiel VALUES(3, 'BE 807 FT', '01/05/2011', 'Achat BRAMINI', 'Tracteur Scania', 2, 1);
INSERT INTO materiel VALUES(4, 'BN 800 WN', '01/05/2011', 'ACHAT STEFANSKI E.I.', 'Tracteur VOLVO', 0, 1);
INSERT INTO materiel VALUES(5, 'BR 894 JS', '12/07/2011', 'Leasing SCANIA', 'Tracteur Scania', 0, 1);
INSERT INTO materiel VALUES(6, 'BR 805 PJ', '18/07/2011', 'Leasing SCANIA', 'Tracteur Scania', 0, 1);
INSERT INTO materiel VALUES(8, 'BB 796 TC', '01/05/2011', 'Achat STEFANSKI E.I.', 'Benne ESTEREL', 0, 2);
INSERT INTO materiel VALUES(9, 'BN 725 WN', '01/05/2011', 'Achat STEFANSKI E.I.', 'Benne BENALU', 0, 2);
INSERT INTO materiel VALUES(10, 'BN 202 RK', '01/05/2011', 'Achat STEFANSKI E.I.', 'Mercedes VITO', 0, 3);

-- -----------------------------
-- insertions dans la table mois
-- -----------------------------

-- -----------------------------
-- insertions dans la table qualitesalarie
-- -----------------------------
INSERT INTO qualitesalarie VALUES(1, 'chauffeur');
INSERT INTO qualitesalarie VALUES(2, 'apprenti');

-- -----------------------------
-- insertions dans la table salaire
-- -----------------------------

-- -----------------------------
-- insertions dans la table salarie
-- -----------------------------
INSERT INTO salarie VALUES(3, 'BARBIER', 'Brandon', '111111', '29/02/1995', 'Montargis', '', 2);
INSERT INTO salarie VALUES(4, 'BILLARD', 'Jérémy', '111111', '20/04/87', 'Fault sur Yonne (77)', '22/06/2011', 1);
INSERT INTO salarie VALUES(5, 'BOURDIN', 'Yvon', '111111', '13/12/49', 'Montargis', '', 1);
INSERT INTO salarie VALUES(6, 'CHIRON', 'Baptiste', '111111', '27/11/1978', 'Longjumeau (91)', '18/06/2012', 1);
INSERT INTO salarie VALUES(7, 'CADEAU', 'Stéphane', '111111', '26/11/1974', 'Pavillon sous Bois (93)', '01/05/2011', 1);
INSERT INTO salarie VALUES(8, 'CHEVALIER', 'Didier', '111111', '13/04/1966', 'Créteil (94)', '09/11/2012', 1);

-- -----------------------------
-- insertions dans la table type_materiel
-- -----------------------------

-- -----------------------------
-- insertions dans la table typecontrat
-- -----------------------------
INSERT INTO typecontrat VALUES(1, 'CDD', '');
INSERT INTO typecontrat VALUES(2, 'CDI', '');

-- -----------------------------
-- insertions dans la table utilisateur
-- -----------------------------
INSERT INTO utilisateur VALUES(1, 'Admin', 'f679c422182842d7ef53d1b4274d3357', 'adrien.stefanski@gmail.com');

