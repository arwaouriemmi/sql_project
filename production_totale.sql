WITH vue AS (
    SELECT
        *,
        -- Traitement des colonnes pour convertir les valeurs non numériques
        "Thermique (MW)" +
        "Nucléaire (MW)" +
        CASE 
            WHEN TRY_CAST("Eolien (MW)" AS BIGINT) IS NOT NULL THEN CAST("Eolien (MW)" AS BIGINT)
            ELSE 0
        END +
        "Solaire (MW)" +
        "Hydraulique (MW)" +
        "Bioénergies (MW)" AS "Production Totale (MW)"
    FROM cleaned_raw_eco2mix
)

SELECT * FROM vue

