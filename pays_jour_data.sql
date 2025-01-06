WITH consommation_par_pays_jour AS (
    SELECT
        -- Pays
        'France' AS pays,

        -- Jour
        "Date",

        -- Sommes des consommations par type
        SUM(consommation_GWh) AS consommation_total_GWh,
        SUM(pompage_GWh) AS pompage_GWh,
        SUM(Thermique_GWh) AS Thermique_GWh,
        SUM(Nucléaire_GWh) AS Nucléaire_GWh,
        SUM(Eolien_GWh) AS Eolien_GWh,
        SUM(Solaire_GWh) AS Solaire_GWh,
        SUM(Hydraulique_GWh) AS Hydraulique_GWh,
        SUM(Bioénergies_GWh) AS Bioénergies_GWh,
        SUM(Production_Totale_GWh) AS Production_Totale_GWh,
        
        -- Moyenne, minimum et maximum des températures par pays et jour
        AVG(temperature_min) AS temperature_min_moyenne,
        AVG(temperature_max) AS temperature_max_moyenne,
        AVG(temperature_avg) AS temperature_avg_moyenne,
        MIN(temperature_min) AS temperature_min_min,
        MAX(temperature_max) AS temperature_max_max
    FROM temperature_consumption
    GROUP BY
        pays,
        "Date"
)
SELECT * FROM consommation_par_pays_jour

