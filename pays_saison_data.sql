WITH consommation_par_pays_saison AS (
    SELECT
        -- Pays
        'France' AS pays,

        -- Identifier la saison
        CASE
            WHEN strftime('%m', "Date") IN ('12', '01', '02') THEN 'Hiver'
            WHEN strftime('%m', "Date") IN ('03', '04', '05') THEN 'Printemps'
            WHEN strftime('%m', "Date") IN ('06', '07', '08') THEN 'Eté'
            ELSE 'Automne'
        END AS saison,

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
        
        -- Moyenne, minimum et maximum des températures par pays et saison
        AVG(temperature_min) AS temperature_min_moyenne,
        AVG(temperature_max) AS temperature_max_moyenne,
        AVG(temperature_avg) AS temperature_avg_moyenne,
        MIN(temperature_min) AS temperature_min_min,
        MAX(temperature_max) AS temperature_max_max
    FROM temperature_consumption
    GROUP BY
        pays,
        saison
)
SELECT * FROM consommation_par_pays_saison
