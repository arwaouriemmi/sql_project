WITH vue AS (
    SELECT
        "Code INSEE région",
        "Région",
        strftime("Date", '%Y-%m') AS Mois, -- Conversion correcte en DuckDB pour obtenir 'yyyy-MM'
        MIN("Production Totale (MW)") AS Production_Min_MW,
        MAX("Production Totale (MW)") AS Production_Max_MW,
        AVG("Production Totale (MW)") AS Production_Moy_MW,
        MIN("Consommation (MW)") AS Consommation_Min_MW,
        MAX("Consommation (MW)") AS Consommation_Max_MW,
        AVG("Consommation (MW)") AS Consommation_Moy_MW
    FROM supp_cols
    GROUP BY 
        "Code INSEE région",
        "Région",
        strftime("Date", '%Y-%m') -- Utilisation de strftime pour regrouper par mois
    ORDER BY Mois, "Code INSEE région"
)

SELECT * FROM vue
