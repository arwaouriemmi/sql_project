WITH vue AS (
    SELECT
        "Date",
        SUM("consommation_GWh") AS consommation_totale_par_date,
        -- Calcul de la consommation totale du mois écoulé
        SUM(SUM("consommation_GWh")) OVER (
            ORDER BY "Date"
            RANGE BETWEEN INTERVAL 1 MONTH PRECEDING AND CURRENT ROW
        ) AS consommation_mois_ecoule_GWh
    FROM Energie_Gwh
    GROUP BY 
        "Date"
)

SELECT * 
FROM vue
ORDER BY "Date"

