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




