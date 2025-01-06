WITH consommation_par_temperature AS (
    SELECT
        CASE
            WHEN temperature_avg < 0 THEN 'Glacial'
            WHEN temperature_avg >= 0 AND temperature_avg < 8 THEN 'Froid'
            WHEN temperature_avg >= 8 AND temperature_avg < 17 THEN 'Modéré'
            WHEN temperature_avg >= 17 AND temperature_avg <= 25 THEN 'Idéal'
            WHEN temperature_avg > 25 AND temperature_avg < 33 THEN 'Chaud'
            ELSE 'Extrême'
        END AS temperature_intervalle,
        "Région",
        "region_code",
        SUM(consommation_GWh) AS consommation_total_GWh,
        SUM(pompage_GWh) AS pompage_GWh,
        SUM(Thermique_GWh) AS Thermique_GWh,
        SUM(Nucléaire_GWh) AS Nucléaire_GWh,
        SUM(Eolien_GWh) AS Eolien_GWh,
        SUM(Solaire_GWh) AS Solaire_GWh,
        SUM(Hydraulique_GWh) AS Hydraulique_GWh,
        SUM(Bioénergies_GWh) AS Bioénergies_GWh,
        SUM(Production_Totale_GWh) AS Production_Totale_GWh,
        AVG(temperature_min) AS temperature_min_moyenne,
        AVG(temperature_max) AS temperature_max_moyenne,
        AVG(temperature_avg) AS temperature_avg_moyenne
    FROM temperature_consumption
    GROUP BY temperature_intervalle, "Région", "region_code"
)
SELECT * FROM consommation_par_temperature

