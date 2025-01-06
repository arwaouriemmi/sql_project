# Documentation des fichiers SQL du projet

Voici les scripts SQL utilisés pour manipuler, agréger et analyser les données de consommation d'énergie et de température pour différentes régions, périodes et intervalles de température. Ci-dessous se trouve une explication du rôle de chaque fichier SQL :

### 1. `cleaned_température.sql`
Ce fichier contient des instructions pour nettoyer et formater les données de température. Il permet d’obtenir des données cohérentes et prêtes à être utilisées pour l’analyse.

### 2. `temperature_consumption.sql`
Ce fichier lie les données de consommation d'énergie avec les données de température. Il permet d’analyser la consommation d’énergie en fonction des variations de température.

### 3. `région_année_data.sql`
Ce fichier agrège les données de consommation d'énergie par année pour chaque **région**. Il permet d’observer les tendances de consommation d'énergie au niveau annuel pour chaque région.

### 4. `région_jour_data.sql`
Ce fichier agrège les données de consommation d'énergie quotidiennes pour chaque **région**. Il permet de suivre les tendances de consommation quotidienne d’énergie dans chaque région.

### 5. `région_mois_data.sql`
Ce fichier agrège les données de consommation d'énergie mensuelles pour chaque **région**. Il permet d’analyser les tendances de consommation d'énergie par mois, au niveau régional.

### 6. `région_saison_data.sql`
Cette requête agrège les données de consommation d'énergie par saison pour chaque **région**. Elle permet d’observer les variations saisonnières de la consommation d'énergie au niveau régional.

### 7. `région_température_data.sql`
Ce fichier combine les données de consommation d'énergie pour chaque **région** avec les données de température. Il permet d'analyser l'impact de la température sur la consommation d'énergie pour chaque région.

### 8. `pays_année_data.sql`
Ce fichier agrège les données de consommation d'énergie par année, pour chaque **pays**. Il fournit des informations sur les tendances de consommation d'énergie au niveau annuel pour chaque pays, qui est composé de plusieurs régions.

### 9. `pays_jour_data.sql`
Ce fichier agrège les données de consommation d'énergie quotidiennes pour chaque **pays**. Il analyse la consommation quotidienne d'énergie en tenant compte des différentes régions composant chaque pays.

### 10. `pays_mois_data.sql`
Ce fichier agrège les données de consommation d'énergie mensuelles pour chaque **pays**. Cette analyse permet de suivre les tendances mensuelles de consommation d'énergie au sein de chaque pays.

### 11. `pays_saison_data.sql`
Cette requête agrège les données de consommation d'énergie par saison pour chaque **pays**. Elle permet de comprendre les tendances saisonnières de la consommation d'énergie au niveau national.

### 12. `pays_température_data.sql`
Ce fichier combine les données de consommation d'énergie pour chaque **pays** avec les données de température. Il permet d'analyser les tendances de consommation d'énergie en fonction des variations de température à l’échelle d’un pays.

### 13. `quart_année_data.sql`
Ce fichier agrège les données de consommation d'énergie par année, pour chaque **quart** (qui est un ensemble spécifique de régions). Il fournit des informations sur les tendances de consommation d'énergie au niveau annuel pour chaque quart, qui regroupe plusieurs régions.

### 14. `quart_jour_data.sql`
Ce script agrège les données de consommation d'énergie quotidiennes par **quart**. Chaque quart étant composé de plusieurs régions, cette analyse permet de suivre les tendances de consommation quotidienne au sein de chaque quart, en tenant compte de la diversité des régions qui le composent.

### 15. `quart_mois_data.sql`
Ce fichier agrège les données de consommation d'énergie mensuelles par **quart**. Chaque mois est regroupé au sein d'un quart spécifique, et cette analyse permet d'observer les tendances mensuelles de consommation d'énergie au sein des quarts, composés de plusieurs régions.

### 16. `quart_saison_data.sql`
Cette requête agrège les données de consommation d'énergie par saison pour chaque **quart**. Un quart étant un ensemble de plusieurs régions, cette analyse fournit des informations sur les tendances de consommation d'énergie saisonnières dans chaque quart, en tenant compte des variations régionales.

### 17. `quart_température_data.sql`
Ce script combine les données de consommation d'énergie pour chaque **quart** avec les données de température. Il regroupe les informations par quart et par intervalles de température, permettant d'analyser les tendances de consommation d'énergie en fonction des variations de température au sein de chaque quart. Un quart étant composé de plusieurs régions, cette analyse permet de considérer l'ensemble des régions au sein d'un quart pour une analyse complète.

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





