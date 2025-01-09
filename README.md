# Documentation des fichiers SQL du projet

Voici les scripts SQL utilisés pour manipuler, agréger et analyser les données de consommation d'énergie et de température pour différentes régions, périodes et intervalles de température. Ci-dessous se trouve une explication du rôle de chaque fichier SQL :

### **Energie_Gwh.sql**
Contient les données de consommation et de production énergétique exprimées en Gigawatt-heure (GWh).

### **Energie_Gwhm.sql**
Fournit les agrégations mensuelles des données énergétiques en GWh, pour simplifier les analyses temporelles à une échelle mensuelle.

### **Energie_Mwh.sql**
Gère les données énergétiques à une résolution plus fine, exprimées en Mégawatt-heure (MWh).

### **aggregation_prod_cons.sql**
Agrège les données de production et de consommation énergétique à différents niveaux (régionaux, mensuels).

### **cleaned_raw_eco2mix.sql**
Nettoie et transforme les données brutes issues de la source `eco2mix`, en supprimant les valeurs aberrantes et en préparant les données pour des analyses ultérieures.

### **consommation_mois_ecoule.sql**
Calcule la consommation énergétique cumulée pour le mois écoulé, utile pour identifier les tendances mensuelles.

### **consommation_quotidienne_région.sql**
Détaille la consommation énergétique quotidienne par région, permettant une analyse granulaire des données .

### **cube_consommation_GWh.sql**
génère un cube de données pour analyser la consommation énergétique en GWh selon plusieurs dimensions : date (jour, mois, année), région et zone géographique (NO, NE, SE, SO, IdF). Il facilite l'agrégation et l'analyse multi-dimensionnelle des données pour identifier des tendances et variations.

### **jour_depassement_annuel.sql**
Identifie pour chaque année le premier jour où la consommation énergétique cumulée dépasse la production renouvelable cumulée.

### **prod_cons_mois.sql**
Génère les agrégations mensuelles des données de production et consommation énergétique pour chaque région.

### **production_totale.sql**
Calcule la production énergétique totale à différents niveaux d'agrégation, en distinguant les différentes sources d'énergie (nucléaire, éolien, solaire, etc.).

### **supp_cols.sql**
Enlève les colonnes TCO car elles sont vides et la colonne Date_heure puisqu'il ya y'a une colonne Date et une colonne Heure.

### **temperature_consumption.sql**
Combine les données de consommation énergétique avec les données climatiques (températures) pour analyser les corrélations entre les deux.

### **top3_sequences_augmentation_consommation.sql**
Identifie les trois plus longues séquences d'augmentation continue de la consommation énergétique, à l'échelle régionale .

### **top_variations_consommation.sql**
Repère les 20 plus grandes variations (absolues) de consommation énergétique, classées par ordre décroissant.

### **cleaned_température.sql**
Ce fichier contient des instructions pour nettoyer et formater les données de température. Il permet d’obtenir des données cohérentes et prêtes à être utilisées pour l’analyse.

### **temperature_consumption.sql**
Ce fichier lie les données de consommation d'énergie avec les données de température. Il permet d’analyser la consommation d’énergie en fonction des variations de température.

### **région_année_data.sql**
Ce fichier agrège les données de consommation d'énergie par année pour chaque **région**. Il permet d’observer les tendances de consommation d'énergie au niveau annuel pour chaque région.

### **région_jour_data.sql**
Ce fichier agrège les données de consommation d'énergie quotidiennes pour chaque **région**. Il permet de suivre les tendances de consommation quotidienne d’énergie dans chaque région.

### **région_mois_data.sql**
Ce fichier agrège les données de consommation d'énergie mensuelles pour chaque **région**. Il permet d’analyser les tendances de consommation d'énergie par mois, au niveau régional.

### **région_saison_data.sql**
Cette requête agrège les données de consommation d'énergie par saison pour chaque **région**. Elle permet d’observer les variations saisonnières de la consommation d'énergie au niveau régional.

### **région_température_data.sql**
Ce fichier combine les données de consommation d'énergie pour chaque **région** avec les données de température. Il permet d'analyser l'impact de la température sur la consommation d'énergie pour chaque région.

### **pays_année_data.sql**
Ce fichier agrège les données de consommation d'énergie par année, pour chaque **pays**. Il fournit des informations sur les tendances de consommation d'énergie au niveau annuel pour chaque pays, qui est composé de plusieurs régions.

### **pays_jour_data.sql**
Ce fichier agrège les données de consommation d'énergie quotidiennes pour chaque **pays**. Il analyse la consommation quotidienne d'énergie en tenant compte des différentes régions composant chaque pays.

### **pays_mois_data.sql**
Ce fichier agrège les données de consommation d'énergie mensuelles pour chaque **pays**. Cette analyse permet de suivre les tendances mensuelles de consommation d'énergie au sein de chaque pays.

### **pays_saison_data.sql**
Cette requête agrège les données de consommation d'énergie par saison pour chaque **pays**. Elle permet de comprendre les tendances saisonnières de la consommation d'énergie au niveau national.

### **pays_température_data.sql**
Ce fichier combine les données de consommation d'énergie pour chaque **pays** avec les données de température. Il permet d'analyser les tendances de consommation d'énergie en fonction des variations de température à l’échelle d’un pays.

### **quart_année_data.sql**
Ce fichier agrège les données de consommation d'énergie par année, pour chaque **quart** (qui est un ensemble spécifique de régions). Il fournit des informations sur les tendances de consommation d'énergie au niveau annuel pour chaque quart, qui regroupe plusieurs régions.

### **quart_jour_data.sql**
Ce script agrège les données de consommation d'énergie quotidiennes par **quart**. Chaque quart étant composé de plusieurs régions, cette analyse permet de suivre les tendances de consommation quotidienne au sein de chaque quart, en tenant compte de la diversité des régions qui le composent.

### **quart_mois_data.sql**
Ce fichier agrège les données de consommation d'énergie mensuelles par **quart**. Chaque mois est regroupé au sein d'un quart spécifique, et cette analyse permet d'observer les tendances mensuelles de consommation d'énergie au sein des quarts, composés de plusieurs régions.

### **quart_saison_data.sql**
Cette requête agrège les données de consommation d'énergie par saison pour chaque **quart**. Un quart étant un ensemble de plusieurs régions, cette analyse fournit des informations sur les tendances de consommation d'énergie saisonnières dans chaque quart, en tenant compte des variations régionales.

### **quart_température_data.sql**
Ce script combine les données de consommation d'énergie pour chaque **quart** avec les données de température. Il regroupe les informations par quart et par intervalles de température, permettant d'analyser les tendances de consommation d'énergie en fonction des variations de température au sein de chaque quart. Un quart étant composé de plusieurs régions, cette analyse permet de considérer l'ensemble des régions au sein d'un quart pour une analyse complète.

### **cuboide.sql**
Permet de construire le __cuboïde__ (la vue) par mois, par quart et par intervalle de température.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## 4. De la zone de transit à l'entrepôt
## Mise à jour incrémentale de l'entrepôt de données

L'objectif de cette procédure est de mettre en place une mise à jour incrémentale de l'entrepôt de données sans recalculer l'intégralité des données. Cela permet d'intégrer de nouvelles données de manière efficace, tout en gérant le passage des données d'un statut à un autre : **temps réel**, **consolidées**, puis **définitives**.

### 1. Concepts clés

- **Données en temps réel** : Ce sont les données fraîches collectées, qui sont immédiatement disponibles mais peuvent encore contenir des erreurs ou des inexactitudes.
- **Données consolidées** : Ce sont des données qui ont été vérifiées et traitées par des processus de nettoyage et de transformation, mais elles sont encore susceptibles d'évoluer (par exemple, par des révisions périodiques).
- **Données définitives** : Ce sont les données entièrement validées et finalisées, prêtes pour les rapports ou l'archivage à long terme.

### 2. Procédure de mise à jour incrémentale

La mise à jour incrémentale se fait selon le statut des données. Les nouvelles données arrivent dans l'entrepôt avec un statut initial de **temps réel**, puis elles sont progressivement mises à jour en **données consolidées** et enfin en **données définitives**.

#### a) Phase 1 : Insertion des données en temps réel

**Données en temps réel** : Lors de l’arrivée de nouvelles données, celles-ci sont d'abord insérées dans des tables spécifiques marquées avec le statut **temps réel**.
- **Exemple** : Des données de consommation énergétique de la journée sont insérées dans une table `consommation_temporelle` avec le statut "temps réel".
- **Action** : Une requête `INSERT` est exécutée pour ajouter ces nouvelles données sans affecter les données précédemment traitées.

#### b) Phase 2 : Passage des données de temps réel à consolidées

**Consolidation des données** : De manière périodique (par exemple, à la fin de chaque mois), les données en temps réel sont extraites, nettoyées, et agrégées dans des tables de données consolidées. Ces données sont alors marquées comme **consolidées**.
- **Exemple** : Les données de consommation énergétique mensuelles sont agrégées par région et par mois.
- **Action** : Une tâche programmée (par exemple, un cron job ou une tâche dans un workflow d'ETL) exécute une **requête d'agrégation** qui extrait les données des tables **temps réel**, effectue les agrégations nécessaires, et insère ces données dans les tables consolidées.
- Les données insérées dans les tables consolidées sont maintenant considérées comme prêtes à l’analyse, bien que sujettes à des mises à jour futures.

#### c) Phase 3 : Passage des données consolidées à définitives

**Validation finale** : Après une période de révision, les données consolidées sont considérées comme **définitives** lorsqu’elles ont été complètement validées et ne nécessitent plus d'ajustements.
- **Action** : Une fois qu’une période de révision est passée (par exemple, après un mois), les données consolidées sont marquées comme **définitives**.
  - Pour chaque table consolidée, une requête `UPDATE` est exécutée pour mettre à jour le statut des données vers **définitives**.

**Ouverture vers une architecture Lambda**
![image](https://github.com/user-attachments/assets/132b9cf6-ce8f-4219-8da1-a82c65426210)

Bien que cette procédure décrive un processus de mise à jour incrémentale traditionnel, il est possible d’envisager une architecture Lambda pour une gestion plus robuste des données en temps réel et en batch.
Dans une architecture Lambda, la mise à jour des données pourrait se faire en combinant un traitement batch pour les données consolidées et un traitement temps réel pour les données fraîches. Ce modèle hybride permet de gérer des flux de données en temps réel tout en maintenant des processus batch pour des analyses historiques et consolidées.
L'implémentation d'une architecture Lambda offre une grande flexibilité et évolutivité, permettant une gestion efficace des données tout au long de leur cycle de vie, tout en optimisant les coûts et la performance.





