-- a)
-- Sélectionne les colonnes prénom et nom de la table membre, ainsi que le nom du groupe et le libellé de l'instrument joué
SELECT membre.prenom, membre.nom, groupe.nom, instrument.libelle
-- Joint la table membre avec la table Jouer_Groupe en utilisant l'idMembre comme clé étrangère
-- pour associer chaque membre à tous les groupes auxquels il participe
INNER JOIN Jouer_Groupe
ON Membre.id = Jouer_Groupe.idMembre
-- Joint la table Groupe avec la table Jouer_Groupe en utilisant l'idGroupe comme clé étrangère
-- pour associer chaque groupe à tous ses membres
INNER JOIN Groupe
ON Groupe.id = Jouer_Groupe.idGroupe
-- Joint la table Instrument avec la table Jouer_Groupe en utilisant l'idInstrument comme clé étrangère
-- pour associer chaque instrument à tous les membres qui le jouent dans un groupe
INNER JOIN Instrument
ON Instrument.id = Jouer_Groupe.idInstrument
-- Trie les résultats en ordre alphabétique croissant sur le nom de groupe
ORDER BY groupe.nom ASC

--b)
SELECT Groupe.nom, COUNT(*) AS nb_membres
FROM Groupe
-- Joint la table Jouer_Groupe avec la table Groupe en utilisant l'idGroupe comme clé étrangère
-- pour associer chaque membre à son groupe correspondant
INNER JOIN Jouer_Groupe
ON Jouer_Groupe.idGroupe = Groupe.id
-- Utilise la fonction COUNT() pour compter le nombre de membres dans chaque groupe
GROUP BY Groupe.nom