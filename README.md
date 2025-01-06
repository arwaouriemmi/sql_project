# Documentation des fichiers SQL du projet

Ce dépôt contient des scripts SQL utilisés pour manipuler, agréger et analyser les données de consommation d'énergie et de température pour différentes régions, périodes et intervalles de température. Ci-dessous se trouve une explication du rôle de chaque fichier SQL :

### 1. `cleaned_température.sql`
Ce script traite et nettoie les données de température, en veillant à ce que les données soient correctement formatées et prêtes pour une analyse ultérieure. Il supprime les entrées de température invalides ou manquantes et prépare le jeu de données pour l'agrégation.

### 2. `temperature_consumption.sql`
Ce fichier combine les données de température et de consommation d'énergie, en alignant les deux ensembles de données par région et par date. Il génère une vue unifiée qui peut être utilisée pour une analyse de la corrélation entre les variations de température et la consommation d'énergie.

### 3. `région_année_data.sql`
Cette requête agrège les données de consommation d'énergie au niveau régional par année. Elle calcule la consommation totale et d'autres statistiques pertinentes (comme la production d'énergie renouvelable) pour chaque région et chaque année.

### 4. `région_jour_data.sql`
Ce script agrège les données de consommation d'énergie quotidiennes par région. Il calcule les totaux quotidiens pour la consommation et la production d'énergie, regroupés par région et par date.

### 5. `région_mois_data.sql`
Ce fichier effectue l'agrégation des données de consommation d'énergie mensuelles pour chaque région. Il fournit les totaux et les moyennes pour chaque région et chaque mois.

### 6. `région_saison_data.sql`
Cette requête agrège les données de consommation d'énergie par région pour chaque saison (Hiver, Printemps, Été, Automne). Elle calcule les statistiques de consommation et de production en fonction des périodes saisonnières.

### 7. `région_température_data.sql`
Ce script combine les données de consommation d'énergie régionales avec les données de température, en regroupant les résultats par région et par intervalle de température. Il permet d'analyser les tendances de consommation d'énergie en fonction des variations de température.

### 8. `pays_année_data.sql`
Ce script agrège les données de consommation d'énergie au niveau national par année. Il fournit un aperçu de la consommation totale et de la production par pays pour chaque année.

### 9. `pays_jour_data.sql`
Ce fichier agrège les données de consommation d'énergie quotidiennes par pays, permettant une comparaison quotidienne de la consommation d'énergie au niveau national.

### 10. `pays_mois_data.sql`
Ce script agrège les données énergétiques mensuelles par pays. Il calcule la consommation et la production totales, regroupées par pays et par mois.

### 11. `pays_saison_data.sql`
Cette requête agrège les données de consommation d'énergie au niveau national par saison. Elle calcule les statistiques de consommation et de production pour chaque pays en fonction des périodes saisonnières.

### 12. `pays_température_data.sql`
Ce script combine les données de consommation d'énergie nationales avec les données de température, regroupées par pays et par intervalles de température. Il permet d'analyser la relation entre la température et la consommation d'énergie au niveau national.

### 13. `quart_année_data.sql`
Ce fichier agrège les données de consommation d'énergie par trimestre de l'année, au niveau régional. Il fournit des informations sur les tendances de consommation d'énergie par trimestre pour différentes régions.

### 14. `quart_jour_data.sql`
Ce script agrège les données de consommation d'énergie quotidiennes par trimestre. Il permet une analyse détaillée des tendances de consommation quotidienne au sein de chaque trimestre de l'année.

### 15. `quart_mois_data.sql`
Ce fichier agrège les données de consommation d'énergie mensuelles par trimestre. Il calcule les tendances de consommation d'énergie par mois, divisées par périodes trimestrielles.

### 16. `quart_saison_data.sql`
Cette requête agrège les données énergétiques par saison pour chaque trimestre. Elle fournit des informations sur les tendances de consommation d'énergie saisonnières dans chaque trimestre.

### 17. `quart_température_data.sql`
Ce script combine les données de consommation d'énergie pour chaque trimestre avec les données de température, regroupées par trimestre et par intervalles de température. Il permet l'analyse des tendances de consommation d'énergie en fonction des variations de température à l'échelle trimestrielle.


