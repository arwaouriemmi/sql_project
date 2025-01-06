WITH vue AS (
    SELECT
        "Code INSEE région",
        "Région",
        "Date" ,
        -- Somme pour chaque type d'énergie, avec traitement des valeurs non numériques
        SUM("Consommation (MW)")*0.5 AS consommation_MWh,
        SUM("Pompage (MW)")*0.5 AS pompage_MWh,
        SUM("Thermique (MW)")*0.5 AS Thermique_MWh,
        SUM("Nucléaire (MW)")*0.5 AS Nucléaire_MWh,
        SUM(
            CASE
                WHEN TRY_CAST("Eolien (MW)" AS BIGINT) IS NOT NULL THEN CAST("Eolien (MW)" AS BIGINT)
                ELSE 0
            END
        )*0.5 AS Eolien_MWh,
        SUM("Solaire (MW)")*0.5 AS Solaire_MWh,
        SUM("Hydraulique (MW)")*0.5 AS Hydraulique_MWh,
        SUM("Bioénergies (MW)")*0.5 AS Bioénergies_MWh,
        SUM("Production Totale (MW)")*0.5 AS Production_Totale_MWh,
        SUM("Ech. physiques (MW)")*0.5 AS echanges_physiques_MWh,
    FROM supp_cols
    GROUP BY 
    "Code INSEE région",
    "Région",
    "Date" 
    ORDER BY "Date"
)

SELECT * FROM vue
