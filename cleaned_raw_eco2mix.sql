

WITH vue AS (
    SELECT
        *,
        -- Conversion des valeurs manquantes ou invalides pour les colonnes BIGINT
        CASE
            WHEN "Consommation (MW)" = '' OR "Consommation (MW)" IS NULL THEN 0
            ELSE CAST("Consommation (MW)" AS BIGINT)
        END AS "Consommation (MW)",
        CASE
            WHEN "Thermique (MW)" = '' OR "Thermique (MW)" IS NULL THEN 0
            ELSE CAST("Thermique (MW)" AS BIGINT)
        END AS "Thermique (MW)",
        CASE
            WHEN "Nucléaire (MW)" = '' OR "Nucléaire (MW)" IS NULL THEN 0
            ELSE CAST("Nucléaire (MW)" AS BIGINT)
        END AS "Nucléaire (MW)",
        CASE
            WHEN "Solaire (MW)" = '' OR "Solaire (MW)" IS NULL THEN 0
            ELSE CAST("Solaire (MW)" AS BIGINT)
        END AS "Solaire (MW)",
        CASE
            WHEN "Hydraulique (MW)" = '' OR "Hydraulique (MW)" IS NULL THEN 0
            ELSE CAST("Hydraulique (MW)" AS BIGINT)
        END AS "Hydraulique (MW)",
        CASE
            WHEN "Pompage (MW)" = '' OR "Pompage (MW)" IS NULL THEN 0
            ELSE CAST("Pompage (MW)" AS BIGINT)
        END AS "Pompage (MW)",
        CASE
            WHEN "Bioénergies (MW)" = '' OR "Bioénergies (MW)" IS NULL THEN 0
            ELSE CAST("Bioénergies (MW)" AS BIGINT)
        END AS "Bioénergies (MW)",
        CASE
            WHEN "Ech. physiques (MW)" = '' OR "Ech. physiques (MW)" IS NULL THEN 0
            ELSE CAST("Ech. physiques (MW)" AS BIGINT)
        END AS "Ech. physiques (MW)",
        
        -- Gestion des colonnes VARCHAR pour les valeurs numériques
        CASE
            WHEN "Eolien (MW)" = '' OR "Eolien (MW)" IS NULL THEN '0'
            WHEN "Eolien (MW)" ~ '^\d+$' THEN "Eolien (MW)"
            ELSE 'Invalid'
        END AS "Eolien (MW)",
        
        -- Colonnes supplémentaires de type VARCHAR traitées de la même manière
        CASE
            WHEN "Stockage batterie" = '' OR "Stockage batterie" IS NULL THEN '0'
            ELSE "Stockage batterie"
        END AS "Stockage batterie",
        
        CASE
            WHEN "Déstockage batterie" = '' OR "Déstockage batterie" IS NULL THEN '0'
            ELSE "Déstockage batterie"
        END AS "Déstockage batterie",
        
        -- Traitement des colonnes pour les pourcentages en VARCHAR
        CASE
            WHEN "TCO Thermique (%)" = '' OR "TCO Thermique (%)" IS NULL THEN '0'
            ELSE "TCO Thermique (%)"
        END AS "TCO Thermique (%)",
        
        CASE
            WHEN "TCH Thermique (%)" = '' OR "TCH Thermique (%)" IS NULL THEN '0'
            ELSE "TCH Thermique (%)"
        END AS "TCH Thermique (%)",
        
        CASE
            WHEN "TCO Nucléaire (%)" = '' OR "TCO Nucléaire (%)" IS NULL THEN '0'
            ELSE "TCO Nucléaire (%)"
        END AS "TCO Nucléaire (%)",
        
        CASE
            WHEN "TCH Nucléaire (%)" = '' OR "TCH Nucléaire (%)" IS NULL THEN '0'
            ELSE "TCH Nucléaire (%)"
        END AS "TCH Nucléaire (%)",
        
        CASE
            WHEN "TCO Eolien (%)" = '' OR "TCO Eolien (%)" IS NULL THEN '0'
            ELSE "TCO Eolien (%)"
        END AS "TCO Eolien (%)",
        
        CASE
            WHEN "TCH Eolien (%)" = '' OR "TCH Eolien (%)" IS NULL THEN '0'
            ELSE "TCH Eolien (%)"
        END AS "TCH Eolien (%)",
        
        CASE
            WHEN "TCO Solaire (%)" = '' OR "TCO Solaire (%)" IS NULL THEN '0'
            ELSE "TCO Solaire (%)"
        END AS "TCO Solaire (%)",
        
        CASE
            WHEN "TCH Solaire (%)" = '' OR "TCH Solaire (%)" IS NULL THEN '0'
            ELSE "TCH Solaire (%)"
        END AS "TCH Solaire (%)",
        
        CASE
            WHEN "TCO Hydraulique (%)" = '' OR "TCO Hydraulique (%)" IS NULL THEN '0'
            ELSE "TCO Hydraulique (%)"
        END AS "TCO Hydraulique (%)",
        
        CASE
            WHEN "TCH Hydraulique (%)" = '' OR "TCH Hydraulique (%)" IS NULL THEN '0'
            ELSE "TCH Hydraulique (%)"
        END AS "TCH Hydraulique (%)",
        
        CASE
            WHEN "TCO Bioénergies (%)" = '' OR "TCO Bioénergies (%)" IS NULL THEN '0'
            ELSE "TCO Bioénergies (%)"
        END AS "TCO Bioénergies (%)",
        
        CASE
            WHEN "TCH Bioénergies (%)" = '' OR "TCH Bioénergies (%)" IS NULL THEN '0'
            ELSE "TCH Bioénergies (%)"
        END AS "TCH Bioénergies (%)"
        
    FROM raw_eco2mix
)

SELECT *
FROM vue 
