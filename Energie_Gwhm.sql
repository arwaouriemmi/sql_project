WITH vue AS (
    SELECT
        "Code INSEE région",
        "Région",
        strftime("Date", '%Y-%m') AS Mois, -- Conversion correcte en DuckDB pour obtenir 'yyyy-MM'
        SUM("consommation_GWh") AS consommation_GWhM,
        SUM("pompage_GWh") AS pompage_GWhM,
        SUM("Thermique_GWh") AS Thermique_GWhM,
        SUM("Nucléaire_GWh") AS Nucléaire_GWhM,
        SUM("Eolien_GWh") AS Eolien_GWhM,
        SUM("Solaire_GWh") AS Solaire_GWhM,
        SUM("Hydraulique_GWh") AS Hydraulique_GWhM,
        SUM("Bioénergies_GWh") AS Bioénergies_GWhM,
        SUM("Production_Totale_GWh") AS Production_Totale_GWhM,
        SUM("echanges_physiques_GWh") AS echanges_physiques_GWhM

    FROM Energie_Gwh
    GROUP BY 
        "Code INSEE région",
        "Région",
        strftime("Date", '%Y-%m') -- Utilisation de strftime pour regrouper par mois
    ORDER BY Mois, "Code INSEE région"
)

SELECT * FROM vue